::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/locksmith_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_fast": 2, 
			"pg.rf_unstoppable": 1.5,
			
			"pg.rf_back_to_basics": 3,  				
			"pg.special.rf_student": 2 			
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeBackground);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_knave"
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
			
			case "pgc.rf_armor":
				return _collection.getMin() - 1;
			
		}
	}
	
});