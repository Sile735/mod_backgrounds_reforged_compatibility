::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/skirmisher_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_trapper"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [
					"pg.rf_throwing"
				],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": [
					"pg.rf_ranged"
				]
			}
		});
	}

	q.getPerkGroupCollectionMin = @() function( _collection )
	{
		switch (_collection.getID())
		{
			case "pgc.rf_weapon":
				return _collection.getMin() + 1;

			case "pgc.rf_fighting_style":
				return _collection.getMin() + 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.special.rf_leadership":
			case "pg.rf_tough":
				return 0.75;

			case "pg.rf_agile":
				return 1.25;

			case "pg.special.rf_back_to_basics":
				return 1.5;

			case "pg.rf_fast":
				return 3;

			case "pg.rf_trained":
			case "pg.rf_vigorous":
			case "pg.rf_tactician":
				return 2;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
