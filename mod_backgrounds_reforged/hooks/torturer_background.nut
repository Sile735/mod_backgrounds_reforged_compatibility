::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/torturer_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 0.8,
			"pg.rf_tough": 3, 			
			"pg.rf_trained": 0.8, 			
			"pg.rf_vicious": 2
			"pg.rf_vigorous": 1.25
			
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeBackground);
		
		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_raider"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [
					"pg.rf_cleaver"
				],
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