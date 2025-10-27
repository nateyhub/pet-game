# DigiPet

A prototype pet-care game built with GameMaker Studio (project: `pettest`).

This repository contains the GameMaker project files, art assets, audio, and source content used while developing a small virtual pet game. The active editable GameMaker project is in the `pettest/` folder.

## Status

- Work in progress (branch: `development-nate`).
- GameMaker IDE version: 2024.13.1.193 (see `pettest/pettest.yyp`).

## Quick start — open and run

1. Install GameMaker Studio 2 / GameMaker 2024 (match IDE version if possible).
2. Open the project by loading `pettest/pettest.yyp` in the GameMaker IDE.
3. Click Run to launch the prototype.

Notes:
- The main rooms include `rm_home` and `rm_home_2` (see `pettest/rooms/`).
- Game systems are implemented in GML scripts in `pettest/scripts/` and objects in `pettest/objects/`.

## Repository layout

- `pettest/` — GameMaker project (project file `pettest.yyp`) containing the game's scripts, objects, rooms, sprites, sounds, and tilesets.
	- `pettest/scripts/` — GML scripts and utilities.
	- `pettest/objects/` — GameMaker objects (game logic and entities).
	- `pettest/rooms/` — Rooms / scenes used by the game.
	- `pettest/sprites/`, `pettest/sounds/`, `pettest/tilesets/` — in-engine assets.
- `aseprite_files/` — source Aseprite (.aseprite/.ase) files and sheets used to produce sprites.
- `sound_files/`, `music_files/`, `audacity_files/` — raw audio assets and Audacity projects.
- `sprites/`, `tilesets/`, `font_files/`, `colours/` — additional exported assets and supporting files.
- `time_and_needs_config.xlsx` — configuration spreadsheet for time/needs balancing.

## Important files and entries

- `pettest/pettest.yyp` — project manifest. It lists rooms, resources, and the recorded IDE version.
- Starting rooms: `rm_home`, `rm_home_2`.
- Scripts implementing game features: `scr_alter_needs`, `scr_dog_actions`, `scr_inventory`, `scr_tasks`, and others in `pettest/scripts/`.

## Requirements & Recommended tools

- YoYo Games GameMaker Studio 2 / GameMaker 2024 (IDE) to open/edit/run the project.
- Aseprite for editing `.aseprite` source art files (assets stored in `aseprite_files/`).
- Paint.NET (some `.pdn` files). 
- Audacity for editing `.aup3` project audio files.
