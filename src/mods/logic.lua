-- =============================================================================
-- LOGIC / GAME MODIFICATION
-- =============================================================================
-- This file is imported from main.lua inside init(), after once_loaded.game has fired.
-- Use it for:
-- - patch-plan helpers
-- - lib.hooks registration
-- - runtime functions that read from the callback-provided store and modify game behavior
--
-- If logic grows, keep this file as the public logic loader/router and split
-- behavior files under src/mods/logic/ or src/mods/behaviors/. Those files should
-- expose bind/create functions and return their own narrow surfaces.
-- luacheck: globals lib

local logic = {}

function logic.bind(data) -- luacheck: ignore data
    return logic
end

-- Enable this shape only when the module actually mutates static game data.
-- function logic.buildPatchPlan(plan, host, store)
--     if store.read("FeatureEnabled") then
--         plan:set(SomeGameTable, "SomeKey", true)
--         host.logIf("Enabled SomeGameTable.SomeKey")
--     end
-- end

function logic.buildPatchPlan(_, _, _) end

function logic.registerHooks(host, store) -- luacheck: ignore host store
    -- Register hooks here if needed. host activation owns refresh/deactivation.
    -- Example:
    -- lib.hooks.Wrap("FunctionName", function(baseFunc, ...)
    --     if not host.isEnabled() or not store.read("FeatureEnabled") then
    --         return baseFunc(...)
    --     end
    --     host.logIf("Feature hook ran")
    --     return baseFunc(...)
    -- end)
end

return logic
