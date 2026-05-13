-- =============================================================================
-- DATA / STORAGE
-- =============================================================================
-- This file is imported from main.lua inside init(), after once_loaded.game has fired.
-- Use it for:
-- - storage definitions
-- - hash group plans
-- - static option lists
-- - lookup tables derived from game data after game script import

local data = {}

data.MODE_VALUES = { "Vanilla", "Chaos", "Custom" }

function data.buildStorage()
    return {
        { type = "bool", alias = "FeatureEnabled", default = false },
        { type = "string", alias = "Mode", default = "Vanilla", maxLen = 32 },
        { type = "string", alias = "FilterText", persist = false, hash = false, default = "", maxLen = 64 },
    }
end

function data.buildHashGroupPlan()
    return {
        {
            key = "main",
            "FeatureEnabled",
            "Mode",
        },
    }
end

return data
