::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/drifter_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 1.5, 			
			"pg.rf_fast": 2, 			
			"pg.rf_tough": 0.75, 
			"pg.rf_vigorous": 2.5			
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
			case "pgc.rf_armor":
				return _collection.getMin() - 1;
		}
	}
	
});