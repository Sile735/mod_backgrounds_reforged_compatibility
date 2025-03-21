::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/druid_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {			
			"pg.rf_tough": 2, 
			"pg.rf_vigorous": 1.5, 

			"pg.special.rf_leadership": 4, 			
			"pg.special.rf_student": 4, 
			"pg.special.rf_gifted": -1
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeBackground);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
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
			case "pgc.rf_shared_1":
				return _collection.getMin() + 1;

			case "pgc.rf_fighting_style":
				return _collection.getMin() - 1;
		}
	}
	
});