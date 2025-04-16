::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/cartographer_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
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

			case "pgc.rf_weapon":
				return _collection.getMin() - 1;

			case "pgc.rf_armor":
				return _collection.getMin() - 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_tough":
				return 0;

			case "pg.rf_vigorous":
				return 0.66;

			case "pg.rf_agile":
				return 2;

			case "pg.special.rf_student":
				return 4;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
