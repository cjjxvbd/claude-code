# Kart Clash 3D

A third-person 3D kart battle game inspired by Smash Karts, in one HTML file. It
uses Three.js for the graphics and PeerJS (WebRTC) for online play.

## Play

Open `index.html` in a browser. It loads Three.js and PeerJS from jsDelivr, so
you need an internet connection.

- **Local:** 1 or 2 players on one device (split screen) plus 2–6 bots.
- **Quick Play:** joins a public match with whoever is playing right now, or
  opens one if nobody is. You can join mid-match; you take over a bot's seat.
- **Private rooms:** one person taps **Host a private room** and shares the
  5-letter code or link. Friends on any device join with **Join room**, even
  mid-match. The host picks the arena, mode, bots and match length.

Up to 8 racers per match.

## What's in it

- **Arenas:**
  - **Smash Stadium:** grandstands, ramps up to a trophy plinth, jump pads.
  - **Snow Park:** a slippery frozen lake, snow decks and fences you can hop.
  - **Lava Pit:** lava pools, bridges and a smoking volcano. Touching lava wrecks you.
  - **Sky Arena:** floating islands with holes and no walls. Fall off and you're out.
- **Modes:**
  - **Free For All:** most KOs wins.
  - **Team Battle:** red vs blue, no friendly fire.
  - **One-Hit KO:** every hit wrecks.
- **Driving:** tap hop to jump over rockets and low fences. Hold hop while
  turning to drift, then let go for a turbo boost (blue, then orange, then pink
  sparks). Look back with C.
- **Weapons from ? boxes:** machine gun, homing rockets, bouncing cannonballs,
  grenades, freezing snowballs, mines, spike spinner, invincibility, fake item
  boxes, nuke and nitro.
- **Cosmetics:** 4 cars (Kart, Buggy, Racer, Monster), 14 drivers, 19 hats,
  16 paint colours, 7 paint finishes, 5 rim styles and 7 boost trails. Leveling
  up unlocks drivers and hats; the rest come from the Shop and Season Pass.
- **Graphics:** bloom glow on lights, lava and neon paint, a sun in the sky,
  skid marks, boost trails, speed lines and a winners' podium with confetti
  after each match.

## Coins, shop and Season Pass

Everything is earned in the game with **coins**. There are no real-money
purchases.

- **Earning coins:** every finished match pays coins (more for KOs and a top-3
  finish). The daily reward pays more for each day in a row you play. Daily
  missions (such as "Grab 15 item boxes") pay coins and Pass XP, and new
  missions appear each day.
- **Shop:** buy cars, drivers, hats, paint colours, paint finishes (Matte,
  Metallic, Neon), rims and boost trails. Tap an item to preview it on your
  kart. Three items are 30% off each day.
- **Season Pass (Season 1 · Turbo Fever):** 30 tiers filled by the XP you earn
  in matches and missions. The free row has coins and cosmetics. The premium
  row unlocks for 1,200 coins and adds exclusive items, including the Monster
  truck, the Ghost driver and Chrome, Rainbow and Gold finishes.
- **Graphics:** choose Low, Medium or High under Play. High adds bloom glow;
  Low turns off real-time shadows for slower phones.

Your coins, unlocks and progress are saved in this browser only, so another
device or a cleared browser starts fresh.

## How online play works

- The host's browser runs the match. It simulates every kart, the bots and the
  weapons, and sends the game state to each player 20 times a second.
- Each player sends their steering, throttle, hop and fire input to the host.
  Your own kart is predicted on your device so it feels responsive, then nudged
  toward the host's position.
- PeerJS's free public server only introduces the players. After that, game
  data goes directly between browsers, through PeerJS's public relay if a
  direct connection can't be made. As in any peer-to-peer game, the players
  in a match can see each other's IP addresses.
- Quick Play uses a few well-known public room names on the PeerJS server: the
  first player to arrive hosts, and everyone else joins. If the host leaves,
  the remaining players find or open a new public match automatically.
- If a player leaves mid-match, a bot takes over their kart. Players whose
  browser stops responding for about 12 seconds are replaced by a bot too.

To share a link that friends can open, host `index.html` on any static site,
for example GitHub Pages, Netlify or Vercel. Opening the file locally works,
but then share the room code instead of the link.

### Self-hosted signaling server (optional)

To use your own [PeerJS server](https://github.com/peers/peerjs-server) instead
of the public one, add these to the URL:

```
index.html?peerhost=your.server.com&peerport=443&peerpath=/
```

Add `&peersecure=0` for plain `ws://`. Share links keep these settings.

## Controls

| | Drive | Fire | Hop / drift | Look back |
|---|---|---|---|---|
| Player 1 | WASD | Space | Left Shift | C |
| Player 2 | Arrow keys | Enter | Right Shift | / |
| Gamepad | Left stick, RT gas, LT reverse | A | B or RB | Y |
| Touch | Drag on the left half | FIRE button | JUMP button | |

P or Esc pauses a local game; online it opens the leave menu.
