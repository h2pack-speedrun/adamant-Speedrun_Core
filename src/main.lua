-- =============================================================================
-- adamant-ModpackSpeedrunCore: Modpack Coordinator
-- =============================================================================
-- luacheck: globals Framework
-- Thin coordinator: wires globals, owns config/setup, delegates everything
-- else to adamant-ModpackFramework.

local mods = rom.mods
mods['SGG_Modding-ENVY'].auto()

---@diagnostic disable: lowercase-global
rom = rom
_PLUGIN = _PLUGIN
game = rom.game
modutil = mods['SGG_Modding-ModUtil']
local chalk   = mods['SGG_Modding-Chalk']
local reload  = mods['SGG_Modding-ReLoad']
---@module "adamant-ModpackFramework"
---@type AdamantModpackFramework
Framework = mods["adamant-ModpackFramework"]

local config = chalk.auto('config.lua')
local PACK_ID = "speedrun"
local WINDOW_TITLE = "Speedrun"
local DEFAULT_PROFILES = {}

local function textColored(ctx, color, text)
    ctx.ui.TextColored(color[1], color[2], color[3], color[4], text)
end

local FRAMEWORK_OPTS = {
    ---@param ctx AdamantModpackFramework.PackQuickContentContext
    drawPackQuickContent = function(ctx)
        local bugFixIds = {
            "BugFixesBoons",
            "BugFixesEncounters",
            "BugFixesWeapons",
        }
        local text, color, hasEntries = ctx.getModulesStatus(bugFixIds)
        if not hasEntries then
            return
        end

        textColored(ctx,
            ctx.colors.info,
            "Toggle all bug-fix modules at once. Use each module tab for individual control."
        )
        textColored(ctx, ctx.colors.text, "Current Status: ")
        ctx.ui.SameLine()
        textColored(ctx, color, text)
        ctx.ui.Spacing()

        if ctx.ui.Button("Enable All") then
            ctx.setModulesEnabled(bugFixIds, true)
        end
        ctx.ui.SameLine()
        if ctx.ui.Button("Disable All") then
            ctx.setModulesEnabled(bugFixIds, false)
        end

        ctx.ui.Separator()
        ctx.ui.Spacing()
    end,
    moduleOrder = {
        "FirstHammer",
        "QoL",
        "RunModsNPCs",
        "RunModsWorld",
        "BugFixesBoons",
        "BugFixesEncounters",
        "BugFixesWeapons",
        "SpeedrunTimer",
    },
}
local frameworkInitialized = false
local rebuildInProgress = false

local function rebuildFramework()
    if rebuildInProgress or not frameworkInitialized then
        return false
    end

    assert(Framework and type(Framework.createPack) == "function",
        "adamant-Speedrun_Core: adamant-ModpackFramework is not loaded")

    rebuildInProgress = true
    local ok = Framework.createPack(PACK_ID, WINDOW_TITLE, config, #config.Profiles, DEFAULT_PROFILES, FRAMEWORK_OPTS)
    rebuildInProgress = false

    if not ok then
        return false
    end

    return true
end

mods.on_all_mods_loaded(function()
    assert(Framework and type(Framework.registerCoordinator) == "function",
        "adamant-Speedrun_Core: adamant-ModpackFramework is not loaded")
    Framework.registerCoordinator(PACK_ID, config, rebuildFramework)
end)

local function init()
    assert(Framework and type(Framework.createPack) == "function",
        "adamant-Speedrun_Core: adamant-ModpackFramework is not loaded")
    local ok = Framework.createPack(PACK_ID, WINDOW_TITLE, config, #config.Profiles, DEFAULT_PROFILES, FRAMEWORK_OPTS)
    frameworkInitialized = ok == true
end

local loader = reload.auto_single()

local function registerGui()
    assert(Framework and type(Framework.createGuiCallbacks) == "function",
        "adamant-Speedrun_Core: adamant-ModpackFramework is not loaded")
    local callbacks = Framework.createGuiCallbacks(PACK_ID)
    rom.gui.add_imgui(callbacks.render)
    rom.gui.add_always_draw_imgui(callbacks.alwaysDraw)
    rom.gui.add_to_menu_bar(callbacks.menuBar)
end

modutil.once_loaded.game(function()
    loader.load(registerGui, init)
end)
