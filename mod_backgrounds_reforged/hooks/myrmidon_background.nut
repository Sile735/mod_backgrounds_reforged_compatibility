::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/myrmidon_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 1.33,
			"pg.rf_fast": 1.5, 
			"pg.rf_tough": 2, 
			"pg.rf_trained": 1.33, 
			"pg.rf_vicious": 1.33, 
			"pg.rf_vigorous": 2, 
			"pg.rf_throwing": 2, 
			"pg.special.rf_leadership": 0.25, 
			"pg.rf_tactician": 2
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeSpecialist);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_raider"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": []
			}
		});
	}

	q.getPerkGroupCollectionMin = @() function( _collection )
	{
		switch (_collection.getID())
		{
			
			case "pgc.rf_weapon":
				return _collection.getMin() + 1;
			
		}
	}
	
});