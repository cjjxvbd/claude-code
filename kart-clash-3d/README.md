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

- **Arenas (8):**
  - **Smash Stadium:** grandstands, ramps up to a trophy plinth, jump pads.
  - **Snow Park:** a slippery frozen lake, snow decks and fences you can hop.
  - **Lava Pit:** lava pools, bridges and a smoking volcano. Touching lava wrecks you.
  - **Sky Arena:** floating islands with holes and no walls. Fall off and you're out.
  - **Desert Canyon:** two banded mesas joined by a high causeway, with cacti and
    boulders on the sand below.
  - **Neon City:** night streets between four glowing tower blocks, with a raised
    plaza and a spinning hologram in the middle.
  - **Jungle Temple:** a stepped stone temple with a shrine on top, surrounded by
    giant trees, idols and ruins.
  - **Pirate Cove:** a sandy island with a beached pirate ship and two small
    islets you reach by jump pad. Drive into the sea and you're out.
- **Modes:**
  - **Free For All:** most KOs wins.
  - **Team Battle:** red vs blue, no friendly fire.
  - **One-Hit KO:** every hit wrecks.
  - **King of the Hill:** score while you're on the glowing hill. Sharing it
    splits the points, and the hill moves every 30 seconds. First to 60 wins.
  - **Last Kart Standing:** 3 lives each while a storm shrinks the arena. Be the
    last kart left.
  - **Capture the Flag:** red vs blue. Steal the enemy flag and bring it to
    your base while your own flag is home. First to 3 captures wins.
  - **Gem Rush:** collect gems. Getting wrecked drops half of yours.
  Quick Play rotates through the modes.
- **Bots:** Easy, Normal or Hard. Harder bots react faster, dodge more and go
  after human players.
- **Tutorial:** six short steps teach driving, hopping, drift boosts, item boxes,
  weapons and jump pads. It pays 250 coins the first time. Start it from the
  "New? Start here" card or from ⚙ Settings.
- **Map events:** about a minute into a match each arena springs a surprise for
  14 seconds, with a warning first: golden boxes (Smash Stadium), a blizzard that
  ices the whole arena (Snow Park), a lava surge (Lava Pit), low gravity (Sky
  Arena), a sandstorm that pushes you sideways (Desert Canyon), a neon speed rush
  (Neon City), a boulder stampede (Jungle Temple) and a high tide that floods
  the beach (Pirate Cove).
- **Driving:** tap hop to jump over rockets and low fences. Hold hop while
  turning to drift, then let go for a turbo boost (blue, then orange, then pink
  sparks). Look back with C.
- **Weapons from ? boxes:** machine gun, homing rockets, bouncing cannonballs,
  grenades, freezing snowballs, mines, spike spinner, invincibility, fake item
  boxes, nuke, nitro, lightning (zaps up to 3 rivals and slows them), oil slick,
  shield (blocks one hit), magnet (steals a rival's item) and grapple (yanks a
  kart towards you). Golden boxes give a power item with double ammo.
- **Kart stats:** each car has slightly different speed, acceleration, handling
  and weight, shown in the Locker. Heavier karts get knocked around less.
- **Quick chat:** preset phrases and emotes only, no free typing. Press T (or tap
  💬) for the chat wheel, or 1–8 to send a phrase. Messages appear over karts and
  also work in the online lobby. Turn it off in ⚙ Settings.
- **Cosmetics:** 4 cars (Kart, Buggy, Racer, Monster), 14 drivers, 19 hats,
  16 paint colours, 7 paint finishes, 5 rim styles and 7 boost trails. Leveling
  up unlocks drivers and hats; the rest come from the Item Shop and Battle Pass.
- **Graphics:** bloom glow on lights, lava and neon paint, a sun in the sky,
  skid marks, boost trails, speed lines and a winners' podium with confetti
  after each match.

## Menu

The main menu is a game lobby in the style of Fortnite and Apex Legends. Your
kart is on show in the middle of the screen, and tabs along the top open each
part of the game:

- **Play:** the playlist card shows the arena and mode. Tap **Change** to pick
  from the arena tiles. Choose VS Bots or Online, then press **Play**. News cards
  on the left link to the Battle Pass, Item Shop and Challenges.
- **Locker:** your name and slots for car, driver, hat, paint, finish, rims and
  boost trail. Tap a slot to change that item.
- **Item Shop**, **Battle Pass** and **Challenges** (described below).
- **⚙ Settings:** graphics quality, music and sound effect volume, the announcer,
  colour-blind friendly team colours, reduce motion, key remapping for player 1,
  quick chat and the tutorial.

The menu and each arena have their own music, and an announcer voice (from your
browser's speech voices) calls out "Go!", multi-KOs and the last ten seconds.

In an online room, everyone in the room appears side by side in the lobby.

## Coins, shop and Battle Pass

Everything is earned in the game with **coins**. There are no real-money
purchases.

- **Earning coins:** every finished match pays coins (more for KOs and a top-3
  finish). The daily reward pays more for each day in a row you play. Daily
  challenges (such as "Grab 15 item boxes") pay coins and Battle Pass XP, and new
  challenges appear each day.
- **Shop:** buy cars, drivers, hats, paint colours, paint finishes (Matte,
  Metallic, Neon), rims and boost trails. Tap an item to preview it on your
  kart. Items are marked Uncommon, Rare, Epic or Legendary by price. Three items
  are 30% off each day.
- **Battle Pass (Season 1 · Turbo Fever):** 30 tiers filled by the XP you earn
  in matches and challenges. The free row has coins and cosmetics. The premium
  row unlocks for 1,200 coins and adds exclusive items, including the Monster
  truck, the Ghost driver and Chrome, Rainbow and Gold finishes.
- **Challenges tab:**
  - Daily challenges, plus a bonus for finishing all three.
  - Three weekly challenges with bigger rewards.
  - **Rank:** every finished match gains or loses ranked points (RP) based on
    where you place, from Bronze III up to Champion. Hard bots and online matches
    give more.
  - 18 **achievements** that pay coins, such as World Tour (win on all 8 arenas).
  - Career stats (win rate, KO ratio, best streak, favourite item) and your last
    10 matches.
- **Graphics:** choose Low, Medium or High in ⚙ Settings. High adds bloom glow;
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

P or Esc pauses a local game; online it opens the leave menu. T opens quick chat.
Player 1's Fire, Hop and Look back keys can be changed in ⚙ Settings.
