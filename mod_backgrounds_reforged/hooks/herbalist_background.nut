::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/herbalist_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_unstoppable": 0.8, 
			"pg.rf_vicious": 0.8,			
			"pg.rf_vigorous": 0.8,			
			"pg.special.rf_leadership": 0.8, 
			"pg.special.rf_gifted": 5			
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeBackground);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					
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
				return _collection.getMin() - 1;
			
			case "pgc.rf_fighting_style":
				return _collection.getMin() - 1;

			case "pgc.rf_shared_1":
				return _collection.getMin() + 1;
			
		}
	}
	
});