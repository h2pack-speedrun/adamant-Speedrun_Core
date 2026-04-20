-- =============================================================================
-- adamant-ModpackSpeedrunCore: Modpack Coordinator
-- =============================================================================
-- Thin coordinator: wires globals, owns config and def, delegates everything
-- else to adamant-ModpackFramework.

local mods = rom.mods
mods['SGG_Modding-ENVY'].auto()

---@diagnostic disable: lowercase-global
rom = rom
_PLUGIN = _PLUGIN
game = rom.game
modutil = mods['SGG_Modding-ModUtil']
chalk   = mods['SGG_Modding-Chalk']
reload  = mods['SGG_Modding-ReLoad']

config = chalk.auto('config.lua')
public.config = config
local Framework = mods['adamant-ModpackFramework']

local def = {
    NUM_PROFILES    = #config.Profiles,
    defaultProfiles = {},
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

        ctx.drawColoredText(
            ctx.colors.info,
            "Toggle all bug-fix modules at once. Use each module tab for individual control."
        )
        ctx.drawColoredText(ctx.colors.text, "Current Status: ")
        ctx.ui.SameLine()
        ctx.drawColoredText(color, text)
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
        "Hammer Selection",
        "Quality of Life",
        "Run Modifiers: NPCs & Routing",
        "Run Modifiers: World & Combat Tweaks",
        "Bug Fixes: Boons & Hammers",
        "Bug Fixes: Encounters",
        "Bug Fixes: Weapons",
        "Speedrun Timer",
    }


}

local PACK_ID = "speedrun"

local function init()
    Framework.init({
        packId      = PACK_ID,
        windowTitle = "Speedrun",
        config      = config,
        def         = def,
        modutil     = modutil,
    })
end

local loader = reload.auto_single()
modutil.once_loaded.game(function()
    rom.gui.add_imgui(Framework.getRenderer(PACK_ID))
    rom.gui.add_always_draw_imgui(Framework.getAlwaysDrawRenderer(PACK_ID))
    rom.gui.add_to_menu_bar(Framework.getMenuBar(PACK_ID))
    loader.load(init)
end)
