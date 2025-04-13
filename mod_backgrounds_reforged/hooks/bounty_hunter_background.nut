::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/bounty_hunter_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_trapper"
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
				return _collection.getMin() + 2;

			case "pgc.rf_fighting_style":
				return _collection.getMin() + 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_shield":
			case "pg.rf_heavy_armor":
				return 0;

			case "pg.rf_vigorous":
				return 1.25;

			case "pg.rf_light_armor":
				return 1.5;

			case "pg.rf_trained":
				return 2;

			case "pg.rf_fast":
			case "pg.rf_tactician":
				return 3;

			case "pg.rf_vicious":
				return 5;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
