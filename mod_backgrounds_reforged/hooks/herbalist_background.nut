::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/herbalist_background", function(q) {
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
			case "pgc.rf_weapon":
				return _collection.getMin() - 1;

			case "pgc.rf_fighting_style":
				return _collection.getMin() - 1;

			case "pgc.rf_shared_1":
				return _collection.getMin() + 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.special.rf_leadership":
			case "pg.rf_unstoppable":
			case "pg.rf_vicious":
			case "pg.rf_vigorous":
				return 0.8;

			case "pg.rf_gifted":
				return 5;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
