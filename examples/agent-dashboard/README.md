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

**Office view** (the default) is a little animated office building:

- **Each Claude session gets its own floor**, with its folder name on the
  wall sign and a status light (green working, yellow needs you, grey idle).
- The **lead agent** sits at the big desk. Their screens light up and a chip
  above their head shows what they're doing ("✏️ Editing Login.tsx").
- When you send a message, **you** walk in the front door, say hi to
  reception, take the glass elevator up and tell the lead your request. The lead
  writes it on the **whiteboard**.
- When the lead starts helper agents, **the helpers ride the elevator up**,
  line up to get their task ("Can you write login tests?"), then work at their
  own desks with code scrolling on screen. Their tasks appear on the
  whiteboard and get ticked off.
- When a helper finishes, it **walks back to report** ("Done! ✅"), gets a
  thank-you and a burst of confetti, then rides the elevator home.
- When Claude needs your permission, the **lead's phone rings** and a "!"
  bounces over their head. After a finished turn, they go grab a coffee.
- The sky follows **your real time of day**: sun, moon, stars, clouds,
  city lights at night and cars driving by. Clocks on the walls show the real
  time. Add `?hour=21` to the address to preview night.
- **Hover over anyone** to see who they are and what they're working on.

**List view** shows the same thing as plain cards. Switch with the buttons at the top.


| Status    | Meaning                                           |
|-----------|---------------------------------------------------|
| Working   | Claude is running tools or agents                 |
| Needs you | Claude is waiting for a permission or your input  |
| Idle      | The turn finished                                 |
| Quiet     | No events for 10+ minutes while marked working    |

## Options

- Different port: `.\server.ps1 -Port 5000` and `.\install-hooks.ps1 -Port 5000`
- Remove the hooks: `.\install-hooks.ps1 -Remove`
