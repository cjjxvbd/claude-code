# Kart Clash 3D

A third-person 3D kart battle game in one HTML file. It uses Three.js for the
graphics and PeerJS (WebRTC) for online play.

## Play

Open `index.html` in a browser. It loads Three.js and PeerJS from jsDelivr, so
you need an internet connection.

- **Local:** 1 or 2 players on one device (split screen) plus 2–6 bots.
- **Online:** one person taps **Host a room** and shares the 5-letter code or
  the link. Friends on any device (phone, tablet or computer) tap **Join room**.
  Up to 8 racers per room; the host picks how many bots fill the empty spots.

## How online play works

- The host's browser runs the match. It simulates every kart, the bots and the
  weapons, and sends the game state to each player 20 times a second.
- Each player sends their steering, throttle and fire input to the host. Your
  own kart is predicted on your device so it feels responsive, then nudged
  toward the host's position.
- PeerJS's free public server only introduces the players. After that the game
  data goes directly between browsers. If a direct connection can't be made,
  PeerJS falls back to its public relay server.
- If a player leaves mid-match, a bot takes over their kart. If the host
  leaves, the room closes.

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

| | Drive | Fire |
|---|---|---|
| Player 1 | WASD | Space |
| Player 2 | Arrow keys | Enter |
| Gamepad | Left stick, RT gas, LT reverse | A |
| Touch | Drag on the left half | Hold the right half |

P or Esc pauses a local game; online it opens the leave menu.
