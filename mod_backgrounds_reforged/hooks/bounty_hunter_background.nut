::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/bounty_hunter_background", function(q) {
	q.create = @(__original) function()
	{
		::logInfo("Bounty Hunter Background Created");
		__original();
		this.m.PerkTreeMultipliers = {			
			"pg.rf_fast": 3,			
			"pg.rf_trained": 2, 			
			"pg.rf_vicious": 5,
			"pg.rf_vigorous": 1.25, 
			"pg.rf_tactician": 3, 
			"pg.rf_light_armor": 1.5, 
			"pg.rf_heavy_armor": 0, 
			"pg.rf_shield": 0			
		};
		
		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [	
					"pg.rf_trapper"				
				],
				"pgc.rf_shared_1": [					
				],
				"pgc.rf_weapon": [					
				],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": [					
				]
			}
		});
	}

	q.getPerkGroupCollectionMin = @() function( _collection )
	{
		switch (_collection.getID())
		{
			case "pgc.rf_weapon":
				return _collection.getMin() + 2;
			case "pgc.rf_fighting_style":
				return _collection.getMin() + 1;
		}
	}
});
