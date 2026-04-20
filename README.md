# Speedrun Core

Core coordinator for the [Speedrun modpack](https://github.com/h2pack-speedrun/speedrun-modpack).


## What The Speedrun Pack Does

The Speedrun modpack is a collection of speedrun-focused fixes, routing controls, and utility modules for Hades II.

The current modules cover four broad areas:

- `Bug Fixes`
  Targeted fixes for boon, hammer, weapon, and encounter bugs that can affect run consistency.
- `Routing Mods`
  Modules that shape first-hammer selection, NPC spawns, world structure, and surface routing behavior.
- `Utility`
  Quality-of-life improvements for menu flow, reset speed, and keyboard-and-mouse play.
- `Timing`
  Built-in on-screen timer support for RTA and load-removed timing.

## Included Modules

- [BugFixesBoons](https://github.com/h2pack-speedrun/adamant-Speedrun_BugFixesBoons)
- [BugFixesEncounters](https://github.com/h2pack-speedrun/adamant-Speedrun_BugFixesEncounters)
- [BugFixesWeapons](https://github.com/h2pack-speedrun/adamant-Speedrun_BugFixesWeapons)
- [FirstHammer](https://github.com/h2pack-speedrun/adamant-Speedrun_FirstHammer)
- [QoL](https://github.com/h2pack-speedrun/adamant-Speedrun_QoL)
- [RunModsNPCs](https://github.com/h2pack-speedrun/adamant-Speedrun_RunModsNPCs)
- [RunModsWorld](https://github.com/h2pack-speedrun/adamant-Speedrun_RunModsWorld)
- [Timer](https://github.com/h2pack-speedrun/adamant-Speedrun_Timer)

This package provides the shared Speedrun window and the pack-level behavior that ties the Speedrun modules together.

It owns:

- pack identity and coordinator bootstrap
- shared profile slots and default profile data
- module discovery and the combined Speedrun settings UI
- the menu entry and main control surface for the full modpack

Players normally install this as part of the full Speedrun pack, not as a standalone gameplay module.


## Installation

Install through the full [Speedrun modpack](https://github.com/h2pack-speedrun/speedrun-modpack) via r2modman or your preferred ReturnOfModding workflow.

## More Information

- [Speedrun modpack shell repo](https://github.com/h2pack-speedrun/speedrun-modpack)
- [Changelog](CHANGELOG.md)
