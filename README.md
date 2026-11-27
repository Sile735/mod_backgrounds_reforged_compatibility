# More Backgrounds and Events – Reforged Patch

A compatibility patch that makes the backgrounds of **[More Backgrounds and Events](https://www.nexusmods.com/battlebrothers/mods/769)**
work with **[Reforged](https://github.com/Battle-Modders/mod-reforged)**'s dynamic perk trees.

---

## What it does

Every background added by More Backgrounds and Events gets a Reforged-style perk tree:
- a fitting **exclusive perk group** (e.g. Laborer, Militia, Soldier, Noble, Pauper, …)
- **weights** for perk groups that suit (or don't suit) the background – e.g. a Barkeep rarely rolls Fast or Swift Strikes but often rolls Tough
- minimum numbers of weapon / armor / fighting style groups where needed
- background-specific tooltips and starting effects for a few special backgrounds

**Covered backgrounds (36):** Arbalester, Atilliator, Barkeep, Berserker, Blacksmith, Bodyguard, Bounty Hunter, Carpenter, Cartographer, Champion, Cobbler, Con Artist, Cook, Dissenter, Drifter, Druid, Falconer, Fletcher, Folk Hero, Gardener, Hangman, Herbalist, Lancer, Leper, Locksmith, Master Archer, Myrmidon, Outlander, Painter, Paladin Commander, Pirate, Roofer, Skirmisher, Surgeon, Torturer, Town Watchman

Full details per background: [spreadsheet](https://docs.google.com/spreadsheets/d/1lBG9PbSkDyVcI7pf9oyUDSJL6zbJjQQLcuhb3NCFpfA/edit?gid=457849423#gid=457849423)

---

## Requirements

- Modern Hooks
- Modding Standards and Utilities (MSU)
- Reforged **0.9+**
- More Backgrounds and Events (updated version)

## Installation

Download the zip from the latest [release](../../releases) and put it (unextracted) into the game's `data` folder.

---

## Changelog

**0.7.3**
- Fixed perk group IDs that do not exist in Reforged, so these weights now apply: Barkeep (Swift Strikes), Fletcher (Leadership), Herbalist (Gifted)
- Fixed: the patch loaded *before* More Backgrounds and Events and Reforged instead of after them

**0.7.2 and earlier**
- Perk trees and perk group weights for all backgrounds; Berserker no longer gets swords; Surgeon tweak
