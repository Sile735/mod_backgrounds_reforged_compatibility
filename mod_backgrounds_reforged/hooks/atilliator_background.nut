::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/atilliator_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_vigorous": 0.5, 
			"pg.special.rf_leadership": 0.5			
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.RangedBackground);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": ["pg.rf_crossbow"],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": ["pg.rf_ranged"]
			}
		});
	}
	
});
