::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/cook_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [
					"pg.rf_dagger"
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
				return _collection.getMin() - 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.special.rf_leadership":
				return 0.5;

			case "pg.rf_fast":
				return 0.75;

			case "pg.rf_tough":
				return 3;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
