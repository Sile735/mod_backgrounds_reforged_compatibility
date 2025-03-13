::modBR <- {
	ID = "mod_backgrounds_and_events_reforged_patch",
	Name = "More Backgrounds and Events Reforged Patch",
	Version = "0.7.0"
}

::modBR.HooksMod <- ::Hooks.register(::modBR.ID, ::modBR.Version, ::modBR.Name);
::modBR.HooksMod.require(["mod_msu", "mod_backgrounds_and_events", "mod_reforged"]);
::logInfo("backgrounds compatiblilty mod to loiad");
::modBR.HooksMod.queue("<mod_backgrounds_and_events", "<mod_reforged" ,">mod_msu", function() {
	::modBR.Mod <- ::MSU.Class.Mod(::modBR.ID, ::modBR.Version, ::modBR.Name);
	::logInfo("backgrounds compatiblilty mod loaded");

	// Add an official mod source and turn on automatic in-game reminder about new updates
	::modBR.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/Sile735/mod_backgrounds_reforged_compatibility");
	::modBR.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	::include("mod_backgrounds_reforged/load");		// Load mod adjustments and other hooks	
});

// Checklist:
// - replace all instances of "modMODID" (in all files) with your mods global key handle of choice. This id should be unique enough to hopefully not ever be picked by someone else
// - replace all instances of "mod_MODID" (in all files) with your modid of choice. Mods usually always start with "mod_". This id should be unique enough to hopefully not ever be picked by someone else
// - replace all instances of "mod_MODID" in all existing folders and scriptnames
// - replace "MODID" in the name of this (main) file with your modid of choice.
// - replace the value of 'Name' with your written out mod name separated with spacebars
// - 'Version' will normally start at 0.1.0 for your first version/release
