<#
  Claude Code agent dashboard server.
  Receives Claude Code hook events (HTTP hooks) and serves a live dashboard.

  Run:   powershell -ExecutionPolicy Bypass -File .\server.ps1
  Open:  http://localhost:4317  in Chrome
#>
param([int]$Port = 4317)

$ErrorActionPreference = 'Stop'
$here      = Split-Path -Parent $MyInvocation.MyCommand.Path
$htmlPath  = Join-Path $here 'dashboard.html'
$maxEvents = 5000
$maxBody   = 16384   # bytes; bigger hook payloads get tool_response trimmed

$events = New-Object System.Collections.Generic.List[string]
$nextId = 1
$utf8   = New-Object System.Text.UTF8Encoding $false

function Send($ctx, [int]$code, [string]$type, [byte[]]$bytes) {
  $r = $ctx.Response
  $r.StatusCode = $code
  $r.ContentType = $type
  $r.Headers['Cache-Control'] = 'no-store'
  $r.ContentLength64 = $bytes.Length
  $r.OutputStream.Write($bytes, 0, $bytes.Length)
  $r.OutputStream.Close()
}
function SendText($ctx, [int]$code, [string]$type, [string]$text) {
  Send $ctx $code $type ($utf8.GetBytes($text))
}

function Trim-Payload([string]$body) {
  if ($body.Length -le $maxBody) { return $body }
  try {
    $o = $body | ConvertFrom-Json
    if ($o.PSObject.Properties['tool_response']) { $o.tool_response = '(large output trimmed)' }
    if ($o.PSObject.Properties['tool_input'] -and $o.tool_input.PSObject.Properties['content']) {
      $o.tool_input.content = '(large content trimmed)'
    }
    $s = $o | ConvertTo-Json -Depth 20 -Compress
    if ($s.Length -le $maxBody * 4) { return $s }
  } catch {}
  return '{"hook_event_name":"Unknown","note":"payload too large"}'
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()

Write-Host ""
Write-Host "  Claude agent dashboard is running" -ForegroundColor Green
Write-Host "  Open in Chrome:  http://localhost:$Port" -ForegroundColor Cyan
Write-Host "  Hook endpoint:   http://localhost:$Port/hook"
Write-Host "  Press Ctrl+C to stop."
Write-Host ""

try {
  while ($listener.IsListening) {
    $task = $listener.GetContextAsync()
    while (-not $task.AsyncWaitHandle.WaitOne(250)) { }   # lets Ctrl+C work
    $ctx = $task.GetAwaiter().GetResult()
    $req = $ctx.Request
    $path = $req.Url.AbsolutePath
    try {
      if ($req.HttpMethod -eq 'POST' -and $path -eq '/hook') {
        $reader = New-Object System.IO.StreamReader($req.InputStream, $utf8)
        $body = $reader.ReadToEnd(); $reader.Close()
        if (-not $body) { $body = '{}' }
        $body = Trim-Payload $body
        $ts = [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
        $events.Add('{"id":' + $nextId + ',"ts":' + $ts + ',"e":' + $body + '}')
        $nextId++
        if ($events.Count -gt $maxEvents) { $events.RemoveRange(0, $events.Count - $maxEvents) }
        SendText $ctx 200 'application/json' '{}'   # empty JSON = no effect on Claude
      }
      elseif ($req.HttpMethod -eq 'GET' -and $path -eq '/events') {
        $since = 0
        [int]::TryParse($req.QueryString['since'], [ref]$since) | Out-Null
        $firstId = $nextId - $events.Count
        $start = [Math]::Max(0, $since - $firstId + 1)
        $slice = if ($start -lt $events.Count) { $events.GetRange($start, $events.Count - $start) } else { @() }
        SendText $ctx 200 'application/json' ('[' + ($slice -join ',') + ']')
      }
      elseif ($req.HttpMethod -eq 'POST' -and $path -eq '/clear') {
        $events.Clear()
        SendText $ctx 200 'application/json' '{}'
      }
      elseif ($req.HttpMethod -eq 'GET' -and ($path -eq '/' -or $path -eq '/index.html')) {
        Send $ctx 200 'text/html; charset=utf-8' ([System.IO.File]::ReadAllBytes($htmlPath))
      }
      else {
        SendText $ctx 404 'text/plain' 'not found'
      }
    } catch {
      try { SendText $ctx 500 'text/plain' 'error' } catch {}
    }
  }
} finally {
  $listener.Stop(); $listener.Close()
  Write-Host "Dashboard stopped."
}
