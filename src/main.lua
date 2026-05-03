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
---@module "adamant-ModpackLib"
---@type AdamantModpackLib
lib = mods["adamant-ModpackLib"]
---@module "adamant-ModpackFramework"
---@type AdamantModpackFramework
Framework = mods["adamant-ModpackFramework"]

local config = chalk.auto('config.lua')
local PACK_ID = "speedrun"
local WINDOW_TITLE = "Speedrun"
local DEFAULT_PROFILES = {}

local function textColored(ctx, color, text)
    lib.imguiHelpers.textColored(ctx.ui, color, text)
end

local FRAMEWORK_OPTS = {
    ---@param ctx AdamantModpackFramework.QuickSetupContext
    renderQuickSetup = function(ctx)
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

    assert(Framework and type(Framework.init) == "function",
        "adamant-Speedrun_Core: adamant-ModpackFramework is not loaded")

    rebuildInProgress = true
    local ok, err = xpcall(function()
        Framework.init(PACK_ID, WINDOW_TITLE, config, #config.Profiles, DEFAULT_PROFILES, FRAMEWORK_OPTS)
    end, debug.traceback)
    rebuildInProgress = false

    if not ok then
        error(string.format("Framework rebuild failed for pack '%s': %s", PACK_ID, tostring(err)))
    end

    return true
end

mods.on_all_mods_loaded(function()
    assert(lib and lib.lifecycle and type(lib.lifecycle.registerCoordinator) == "function",
        "adamant-Speedrun_Core: adamant-ModpackLib is not loaded")
    lib.lifecycle.registerCoordinator(PACK_ID, config)
    lib.lifecycle.registerCoordinatorRebuild(PACK_ID, rebuildFramework)
end)

local function init()
    assert(Framework and type(Framework.init) == "function",
        "adamant-Speedrun_Core: adamant-ModpackFramework is not loaded")
    Framework.init(PACK_ID, WINDOW_TITLE, config, #config.Profiles, DEFAULT_PROFILES, FRAMEWORK_OPTS)
    frameworkInitialized = true
end

local loader = reload.auto_single()

local function registerGui()
    assert(Framework and type(Framework.registerGui) == "function",
        "adamant-Speedrun_Core: adamant-ModpackFramework is not loaded")
    Framework.registerGui(PACK_ID)
end

modutil.once_loaded.game(function()
    loader.load(registerGui, init)
end)
