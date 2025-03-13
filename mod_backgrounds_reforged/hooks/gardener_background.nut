::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/gardener_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_laborer"
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
				return 0.5;

			case "pg.rf_fast":
				return 2;

			case "pg.rf_unstoppable":
				return 1.25;

			case "pg.rf_vigorous":
				return 1.33;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
