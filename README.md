# TODO_ModName

> TODO: Short description of what this mod does.

Part of the [TODO_PackTitle modpack](TODO_ShellUrl).

## What It Does

TODO: Explain what this module lets players control.

## Gameplay Impact

TODO: Explain how this module changes a run when enabled.

## How To Use

Install using r2modman. In game, open the TODO_PackTitle menu and configure this module from the shared settings window.

## Development

This template targets the adamant Lib/Framework module contract:

- `main.lua` owns `config`, `MODULE_ANCHOR`, host creation, and activation
- module pieces are imported from `init()` after `modutil.once_loaded.game(...)`
- data objects are returned directly from `mods/data.lua`
- logic/UI modules receive dependencies through explicit `.bind(...)` or `.create(...)` calls
- modules are constructed with `lib.createModule({ ... })`
- `host.activate()` publishes the live host and runs hooks/integrations/lifecycle side effects
- custom storage should be returned by `data.buildStorage()`; modules with no custom settings may omit storage
- storage defaults live in `definition.storage`; `config.lua` can stay empty
- hash layout hints use `hashGroupPlan`, usually returned by `data.buildHashGroupPlan()`
- standalone mode uses `lib.standaloneHost(PLUGIN_GUID)` and stores the runtime on `MODULE_ANCHOR`
- module UI is written in `ui.drawTab(imgui, session)`
- optional quick UI is written in `ui.drawQuickContent(imgui, session)`
- mutation lifecycle is declared through `registerPatchMutation` and/or manual `apply/revert`
- runtime hooks should be declared inside `logic.registerHooks(host, store)`
- hosted modules should use ownerless `lib.hooks.Wrap`, `lib.hooks.Override`, or `lib.hooks.Context.Wrap` from inside `registerHooks`
- module logic that runs outside the draw path should use the `host, store` passed to hooks or mutation callbacks

Template files:

- `src/main.lua` for the module entrypoint
- `src/mods/data.lua` for storage, hash group plans, static option lists, and lookup data
- `src/mods/logic.lua` for patch plans, hooks, and runtime game modifications
- `src/mods/ui.lua` for `drawTab` and optional `drawQuickContent`

Scaling rule:

- keep `main.lua`, `mods/data.lua`, `mods/ui.lua`, and `mods/logic.lua` as the top-level contract
- let `mods/ui.lua` import `mods/ui/*.lua` section files when UI grows
- let `mods/logic.lua` import `mods/logic/*.lua` or `mods/behaviors/*.lua` files when game logic grows
- keep host construction and activation in `main.lua`
- keep storage schema and hash group plans in `mods/data.lua`
- keep `MODULE_ANCHOR` limited to Lib plumbing such as owner stability and standalone UI runtime

Canonical docs:

- [ModpackLib GETTING_STARTED.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/GETTING_STARTED.md)
- [ModpackLib MODULE_AUTHORING.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/MODULE_AUTHORING.md)
- [ModpackLib HOT_RELOAD_ARCHITECTURE.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/HOT_RELOAD_ARCHITECTURE.md)
- [ModpackLib KNOWN_LIMITATIONS.md](https://github.com/h2-modpack/adamant-ModpackLib/blob/main/docs/KNOWN_LIMITATIONS.md)

Module contract notes:

- `lib.standaloneHost(...)` requires the same plugin guid passed to `lib.createModule(...)`
- coordinated modules should declare `modpack`, `id`, and `name`; Lib injects `Enabled` and `DebugMode`
- Framework renders one tab per module

## Local Setup

1. Clone this repo
2. Run `Setup/init_repo.bat` or `Setup/init_repo.sh`
3. Run `Setup/deploy_local.bat` or `Setup/deploy_local.sh`
