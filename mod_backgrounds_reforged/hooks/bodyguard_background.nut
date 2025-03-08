::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/bodyguard_background", function(q) {
	q.create = @(__original) function()
	{
		::logInfo("Bodyguard Background Created");
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 2,
			"pg.rf_fast": 0,			
			"pg.rf_tactician": 2,
			"pg.rf_tough": 3,
			"pg.rf_vicious": 0,
			"pg.special.rf_professional": -1
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeOnly);
		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeSpecialist);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [					
				],
				"pgc.rf_shared_1": [
					"pg.rf_trained"
				],
				"pgc.rf_weapon": [					
				],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": [
					"pg.rf_shield"
				]
			}
		});
	}

	q.getPerkGroupCollectionMin = @() function( _collection )
	{
		switch (_collection.getID())
		{
			case "pgc.rf_shared_1":
				return _collection.getMin() + 1;
			case "pgc.rf_weapon":
				return _collection.getMin() + 2;
			case "pgc.rf_armor":
				return _collection.getMin() + 1; 
			case "pgc.rf_fighting_style":
				return _collection.getMin() + 1;
		}
	}
});
