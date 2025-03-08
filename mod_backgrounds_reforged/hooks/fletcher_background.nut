::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/fletcher_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {			
			"pg.rf_tough": 0.75, 
			"pg.rf_leadership": 0.75, 			 
			"pg.rf_fast": 3			
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.RangedBackground);
		
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
			
			case "pgc.rf_armor":
				return _collection.getMin() - 1;
		}
	}
		
});