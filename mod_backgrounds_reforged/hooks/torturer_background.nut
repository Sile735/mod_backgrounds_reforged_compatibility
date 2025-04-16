::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/torturer_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
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

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_agile":
			case "pg.rf_trained":
				return 0.8;

			case "pg.rf_vigorous":
				return 1.25;

			case "pg.rf_vicious":
				return 2;

			case "pg.rf_tough":
				return 3;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
