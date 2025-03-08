::Reforged.HooksMod.hook("scripts/skills/backgrounds/hackflows/berserker_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 0,
			"pg.rf_fast": 0,
			"pg.rf_tactician": 0, 
			"pg.rf_trained": 0,
			"pg.rf_dagger": 0, 
			"pg.rf_spear": 0,
			"pg.rf_polearm": 0,
			"pg.rf_sword": 0.23,
			"pg.special.rf_leadership": 0,
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeOnly);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_wildling"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": [
					"pg.rf_power"
				]
			}
		});
	}
});
