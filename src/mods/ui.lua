-- =============================================================================
-- UI
-- =============================================================================
-- This file is imported from main.lua inside init().
-- Define drawTab and optional drawQuickContent here.
--
-- If the UI grows, keep this file as the public UI loader/router and split sections
-- into files under src/mods/ui/. Those files should expose bind/create functions
-- and return their own narrow draw surfaces.
-- luacheck: globals lib

local ui = {}
local data

function ui.bind(deps)
    data = deps
    return ui
end

function ui.drawQuickContent(imgui, session)
    lib.widgets.dropdown(imgui, session, "Mode", {
        label = "Mode",
        values = data.MODE_VALUES,
        controlWidth = 140,
    })
end

function ui.drawTab(imgui, session)
    lib.widgets.checkbox(imgui, session, "FeatureEnabled", {
        label = "Enable Feature",
        tooltip = "Turns the feature on for this module.",
    })

    lib.widgets.dropdown(imgui, session, "Mode", {
        label = "Mode",
        values = data.MODE_VALUES,
        controlWidth = 180,
    })

    lib.widgets.inputText(imgui, session, "FilterText", {
        label = "Filter",
        controlWidth = 180,
    })

    imgui.Separator()
    imgui.Text("Start here: replace this with your real module UI.")
end

return ui
