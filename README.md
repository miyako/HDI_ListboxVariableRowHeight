![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_ListboxVariableRowHeight

Giving individual listbox rows their own height at runtime, driven by an array rather than a fixed row height. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v16**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

## What it demonstrates

- Setting a per-row height via the `rowHeightSource` form property, bound to a `_Heights` array holding one pixel height per listbox row.
- Reading and writing a single row's height at runtime with `LISTBOX Get row height` / `LISTBOX SET ROW HEIGHT`, independent of the `_Heights` array.
- Editing the `_Heights` array directly in a second listbox and seeing the change reflected immediately in the main listbox, since both share the same array.
- Resetting the demo data (`Button10`) or clearing the height array back to automatic sizing (`Button11`).
- A tab control with three demo pages, sourced from a localized `SAMPLES-{lang}.json` collection and driven by `COLLECTION TO ARRAY`.

## Key commands

| Command | Used for |
|---|---|
| `LISTBOX SET ROW HEIGHT` | Applying `vHeight` to row `vRow` of `LB0` |
| `LISTBOX Get row height` | Reading the current height of row `vRow` from `LB0` |
| `ARRAY LONGINT` | Reloading (`Button10`) or resizing/clearing (`Button11`) the `_Heights` array |
| `SELECTION TO ARRAY` | Loading `[LOREM]` records into the `_Names` / `_Ipsum` / `_Heights` arrays |
| `COLLECTION TO ARRAY` | Expanding the sorted `SAMPLES-{lang}.json` collection into the tab control arrays |
| `JSON Parse` | Reading the localized `SAMPLES-en.json` / `SAMPLES-ja.json` sample data |

## How it works

The startup method `00_Start` opens the `HDI` splash form; its `BtnDemo` object method opens the real demo form `HDI2` in a non-blocking dialog, or returns to design mode if the running version is too old.

`HDI2/method.4dm` calls `initHDI` on load, which parses `SAMPLES-en.json` or `SAMPLES-ja.json` (chosen with `Get database localization`), sorts it with `orderBy`, and spreads it into the `TabControl`/`TextTabControl` arrays with `COLLECTION TO ARRAY` to drive the tab labels and sample text. It then loads every `[LOREM]` record into the `_Names`, `_Ipsum` and `_Heights` arrays with `SELECTION TO ARRAY` -- these feed `LB0`, the shared listbox that stays visible across the "individual row setting" and "heights array" tabs (`OBJECT SET VISIBLE` toggles it on `On Page Change`).

On the second tab, `Button2` ("Set") and `Button3` ("Get") let the user pick a row number (`vRow`) and either apply (`LISTBOX SET ROW HEIGHT`) or read back (`LISTBOX Get row height`) that row's height (`vHeight`) directly on `LB0`. On the third tab, a second listbox (`LB3`) exposes the raw `_Heights` array as an editable column, so changing a value there immediately changes the corresponding row's rendered height in `LB0`. `Button10` reloads `_Names`/`_Ipsum`/`_Heights` fresh from `[LOREM]`, discarding edits; `Button11` clears `_Heights` back to its original length with default (zero) values, which falls back to automatic row sizing via `rowHeightAutoMin`/`rowHeightAutoMax`.

## Points of interest

- Row heights are driven purely by the `rowHeightSource` form property pointing at the `_Heights` array -- no 4D View Pro area is involved in this listbox, despite the splash screen's "4D View Pro Licence required" notice inherited from the original v16 demo.
- `LISTBOX SET ROW HEIGHT` / `LISTBOX Get row height` act on a single row independent of the `_Heights` array, so the demo deliberately shows both mechanisms side by side.
- The same `_Heights` array backs both list boxes (`LB0` and `LB3`); there is only one source of truth for row heights.
- `Button11`'s "Clear" resizes the array back to its original length rather than emptying it, so every row keeps a (zeroed) height entry that falls back to auto sizing, instead of the array becoming out of sync with the row count.

## Modernisation notes

Converted from the original binary `.4DB` to a 4D project.

| Branch | Description | Guidance |
|--------|-------------|----------|
| [`miyako-modernize-hdi-project`](../../tree/miyako-modernize-hdi-project) | Completed the full HDI modernisation on top of `main`: method visibility, XLIFF localisation, `var`/`#DECLARE` syntax, standard menu actions, a rebuilt startup dialog (window reuse, `CALL WORKER`, `BtnDemo` object method), dark mode/Liquid Glass CSS, and listbox display defaults. | [`4dmethods`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dmethods), [`4dlocalise`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dlocalise), [`4dmodernise`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dmodernise), [`4dproject`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dproject), [`4dstartup`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dstartup), [hdi.startup.instructions.md](.github/instructions/hdi.startup.instructions.md), [`4dcss`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dcss), [`4dform`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dform) |

## References

- [4D blog: 4D View Pro -- variable row height in listbox](https://blog.4d.com/4d-view-pro-variable-row-height-in-listbox/)
- [4D documentation: LISTBOX SET ROW HEIGHT](https://developer.4d.com/docs/commands/listbox-set-row-height)
- [4D documentation: LISTBOX Get row height](https://developer.4d.com/docs/commands/listbox-get-row-height)
- [4D documentation: rowHeightSource property](https://developer.4d.com/docs/FormObjects/propertiesListBoxData#row-height-source)
- Original download: [HDI_ListboxVariableRowHeight.zip](https://download.4d.com/Demos/4D_v16/HDI_ListboxVariableRowHeight.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots
