::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/pirate_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_raider"
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
			case "pgc.rf_fighting_style":
				return _collection.getMin() + 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_agile":
				return 2;

			case "pg.rf_fast":
				return 2.5;

			case "pg.rf_vigorous":
				return 1.75;

			case "pg.special.rf_back_to_basics":
				return 2;

			case "pg.special.rf_leadership":
				return 0.75;

			case "pg.rf_trained":
				return 1.5;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
