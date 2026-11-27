// More Backgrounds and Events - Reforged patch: perk trees and perk group weights for the
// backgrounds of "More Backgrounds and Events" (scripts/skills/backgrounds/hackflows/*) under Reforged.
::modBR <- {
	ID = "mod_backgrounds_and_events_reforged_patch",
	Name = "More Backgrounds and Events Reforged Patch",
	Version = "0.7.3"
}

::modBR.HooksMod <- ::Hooks.register(::modBR.ID, ::modBR.Version, ::modBR.Name);
::modBR.HooksMod.require(["mod_msu", "mod_backgrounds_and_events", "mod_reforged"]);
// Load AFTER the mods this patch adapts (">" = after, "<" would be before), so these hooks wrap theirs.
::modBR.HooksMod.queue(">mod_backgrounds_and_events", ">mod_reforged", ">mod_msu", function() {
	::modBR.Mod <- ::MSU.Class.Mod(::modBR.ID, ::modBR.Version, ::modBR.Name);

	// Add an official mod source and turn on automatic in-game reminder about new updates
	::modBR.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/Sile735/mod_backgrounds_reforged_compatibility");
	::modBR.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	foreach (file in ::IO.enumerateFiles("mod_backgrounds_reforged"))
	{
		::include(file);
	}
});
