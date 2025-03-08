::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/champion_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 1.5, 
			"pg.rf_fast": 0,
			"pg.rf_tough": 3, 
			"pg.rf_unstoppable": 2.5,
			"pg.rf_vicious": 2.5,
			"pg.rf_vigorous": 2, 
			"pg.rf_dagger": 0, 
			
			"pg.special.rf_leadership": 10,

			"pg.rf_back_to_basics": 12,
			"pg.special.rf_professional": -1		
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeOnly);
		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeSpecialist);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
				"pgc.rf_shared_1": [
					"pg.rf_tactician",
					"pg.rf_trained"
				],
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
			case "pgc.rf_shared_1":
				return _collection.getMin() + 2;

			case "pgc.rf_weapon":
				return _collection.getMin() + 3;

			case "pgc.rf_fighting_style":
				return _collection.getMin() + 1;
		}
	}
	
});