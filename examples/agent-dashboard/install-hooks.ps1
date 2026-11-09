<#
  Adds HTTP hooks to your user-level Claude Code settings (~/.claude/settings.json)
  so every Claude session you start in PowerShell reports to the dashboard.
  A backup of your settings is saved first. Safe to run more than once.

  Run:        powershell -ExecutionPolicy Bypass -File .\install-hooks.ps1
  Uninstall:  powershell -ExecutionPolicy Bypass -File .\install-hooks.ps1 -Remove
#>
param([int]$Port = 4317, [switch]$Remove)

$ErrorActionPreference = 'Stop'
$url  = "http://localhost:$Port/hook"
$dir  = Join-Path $HOME '.claude'
$file = Join-Path $dir 'settings.json'
$utf8 = New-Object System.Text.UTF8Encoding $false
$hookEvents = 'UserPromptSubmit','PreToolUse','PostToolUse','Notification','Stop','SubagentStop','SessionEnd'

if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
if (Test-Path $file) {
  $raw = [System.IO.File]::ReadAllText($file)
  Copy-Item $file "$file.bak-$(Get-Date -Format yyyyMMdd-HHmmss)"
  $settings = if ($raw.Trim()) { $raw | ConvertFrom-Json } else { New-Object PSObject }
} else {
  $settings = New-Object PSObject
}

if (-not $settings.PSObject.Properties['hooks']) {
  $settings | Add-Member -NotePropertyName hooks -NotePropertyValue (New-Object PSObject)
}

foreach ($ev in $hookEvents) {
  # Keep every existing hook group except ones pointing at this dashboard.
  $groups = @()
  if ($settings.hooks.PSObject.Properties[$ev]) {
    $groups = @($settings.hooks.$ev | Where-Object { -not (@($_.hooks) | Where-Object { $_.url -eq $url }) })
  }
  if (-not $Remove) {
    $groups += [pscustomobject]@{ hooks = @([pscustomobject]@{ type = 'http'; url = $url; timeout = 3 }) }
  }
  if ($settings.hooks.PSObject.Properties[$ev]) { $settings.hooks.PSObject.Properties.Remove($ev) }
  if ($groups.Count -gt 0) { $settings.hooks | Add-Member -NotePropertyName $ev -NotePropertyValue @($groups) }
}

[System.IO.File]::WriteAllText($file, ($settings | ConvertTo-Json -Depth 50), $utf8)

if ($Remove) { Write-Host "Removed dashboard hooks from $file" -ForegroundColor Yellow }
else {
  Write-Host "Dashboard hooks added to $file" -ForegroundColor Green
  Write-Host "Start (or restart) claude in PowerShell and its activity will appear at http://localhost:$Port"
}
