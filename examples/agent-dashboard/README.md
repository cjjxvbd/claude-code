# Claude Agent Dashboard

A live page in Chrome that shows what Claude Code and its agents are doing in
every session you run from PowerShell: your latest request, the main agent's
current step, each subagent it starts, and a running activity feed.

Nothing to install: the server is plain PowerShell, and Claude Code sends it
events through HTTP hooks. Everything stays on your computer (`localhost` only).

## Setup (one time)

```powershell
cd path\to\examples\agent-dashboard
powershell -ExecutionPolicy Bypass -File .\install-hooks.ps1
```

This adds hooks to `~\.claude\settings.json` (a backup is saved next to it).

## Use

1. Start the dashboard server in its own PowerShell window and leave it open:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\server.ps1
   ```
2. Open **http://localhost:4317** in Chrome.
3. In another PowerShell window, run `claude` as usual. Already-open sessions
   need a restart to pick up the hooks.

If the server isn't running, Claude keeps working normally; the hooks just
fail quietly.

## What you'll see

| Status    | Meaning                                           |
|-----------|---------------------------------------------------|
| Working   | Claude is running tools or agents                 |
| Needs you | Claude is waiting for a permission or your input  |
| Idle      | The turn finished                                 |
| Quiet     | No events for 10+ minutes while marked working    |

## Options

- Different port: `.\server.ps1 -Port 5000` and `.\install-hooks.ps1 -Port 5000`
- Remove the hooks: `.\install-hooks.ps1 -Remove`
