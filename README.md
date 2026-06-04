# Speedrun Modpack

Unrelated Mod to the Hades 1 modpack. Just slightly inspired by it is all.

This is a modular Hades II modpack. Every module here can either be installed individually or part of the pack. It brings together first-hammer routing, in-game LiveSplit-style timing, quality-of-life options, gameplay-flow helpers, balance-affecting fixes, and Surface route adjustments under one shared Speedrun settings window.


## Included Modules

### Select First Hammer

Choose the guaranteed first Daedalus Hammer for each weapon aspect.

Instead of taking a random first hammer, you can assign a specific opener to every aspect in the game. Leaving an aspect on None (Random) preserves vanilla behavior for that aspect.

Coverage is grouped by weapon and aspect:

- Staff
- Blades
- Axe
- Torch
- Skull
- Coat

### LiveSplit

Adds native LiveSplit-like timing support to the game.

LiveSplit records runs and shows selected timing information while you play. Its main feature is a compact recording table that tracks your route through a run.

Supported timing views include:

- Underworld routes: Erebus, Oceanus, Fields, and Tartarus
- Surface routes: Ephyra, Thessaly, Olympus, and The Summit
- Dream Dive routes, with biome order detected from the run
- Single-run split recording
- Multi-run batch recording for routing or practice sessions
- IGT, RTA, and LrT timing columns

### Quality of Life

Adds practical speedrun quality-of-life options for cleaner menus, faster resets, and better keyboard-and-mouse handling.

Current options:

- KBM Escape Fix
  Makes Escape work during boon and pom selection, Hex selection, Path of Stars, and death sequences.
- Rerolling Saves the Game
  Saluting the Oath statue now triggers a game save.
- Always Show Location
  Always displays the current location in the UI.
- Skip Death Cutscene
  Skips the death cutscene and returns you to the main menu faster while still showing the death screen.
- Auto Skip Dialogue
  Automatically skips dialogue prompts during gameplay.
- Skip Run End Cutscene
  Skips the end-of-run cutscene and returns you to the main menu faster while still showing the victory screen.
- Spawn in Training Grounds
  Spawns you in the Training Grounds instead of the House of Hades. Useful for testing and practicing.
- Arcana & Fear on Victory Screen
  Displays Arcana and Fear on the victory screen.

### Gameplay QoL

Adds run-flow and routing helpers without changing the broader balance package.

Current options:

- Familiar Delay Fix
  Fixes Familiars being summoned after a delay upon entering a room.
- Miniboss Encounter Fix
  Fixes minibosses with top-screen health bars not properly progressing biome depth.
- Corrosion Fix
  Fixes Corrosion aggroing enemies on Thessaly boats.
- Skip Gem Boss Reward
  Stops bosses from dropping gem rewards when using Grave Thirst.
- Prevent Echo Scam
  Blocks both Fields minibosses from spawning in room 3 to prevent Echo scam.
- Disable Selene Before First Boon
  Prevents Selene from spawning before the first boon is obtained.
- Disable Arachne Pity
  Disables Arachne pity entirely for Any Fear runs.
- Force Arachne Spawn
  Forces Arachne to spawn to reduce death pity reset.
- Force Medea Spawn
  Forces Medea to spawn to reduce death pity reset.
- Incrementing Fig Leaf
  Dionysus skip chance starts at the default value, increases by 13% after every encounter, and resets on biome start.

### Balance Changes

Adds optional fixes and rule changes that alter weapon, boon, encounter, or damage behavior for speedrun consistency.

Current options:

- Braid Fix
  Fixes Braid of Atlas to properly buff casts.
- Cardio Torch Fix
  Fixes Cardio Gain interactions with Torch specials.
- ET Fix
  Fixes ET working with Anubis by creating a third omega attack field. Also fixes Anubis omega attack distance based on casting angle.
- Omega Cast Fix
  Fixes omega-cast moves not counting as cast damage.
- Poseidon Waves Fix
  Fixes Poseidon waves on Axe special and Hidden Helix Torch.
- Remove Second Channeling
  Removes the second charge stage of Glorious Disaster and Giga Moonburst, baking the bonus into stage 1.
- Shimmering Moonshot Fix
  Fixes Shimmering Moonshot not applying its damage bonus to omega special.
- Extra Dose Fix
  Fixes Extra Dose interactions with Coat second punch and dash strike.
- Aspect of Selene Fix
  Makes Aspect of Selene properly register its Hex so Path of Stars can be offered directly. Skyfall starts at full Moonglow.
- Axe and Blade Omega Channel Fix
  Fixes Axe omega attack and Blade omega special not benefiting correctly from channeling bonuses.
- Tidal Ring Fix
  Fixes Tidal Ring not hitting the same mob twice with Circe.
- GGG Echo Fix
  Allows GGG to be offered in Jeweled Pom runs.
- Suffering Fix
  Fixes Suffering on Sight not bypassing the Wards vow when dealing damage.

### Surface Rebalance

Adds Surface-specific route and encounter changes for speedrun routing.

Current options:

- Force Thessaly Miniboss
  Forces one Thessaly miniboss to appear between rooms 2-4.
- Force Olympus Midshop
  Forces the Olympus midshop to appear between rooms 5-7.
- Remove Thessaly Heracles
  Removes Heracles encounter options from Thessaly.
- Adjust Charybdis Behavior
  At phase transition, tentacles despawn in 1 second instead of 9 seconds. Charybdis fires 6 spits instead of 8.

## How To Use

Install via r2modman. In game, open the Speedrun menu and configure the modules from the shared settings window.

The Quick Setup tab provides module-level enable toggles. Open a module tab for individual settings.

## More Information

- [Changelog](CHANGELOG.md)
- [Speedrun shell repo](https://github.com/h2pack-speedrun/speedrun-modpack)
