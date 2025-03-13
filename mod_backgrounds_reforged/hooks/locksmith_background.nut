::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/locksmith_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_knave"
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
			case "pgc.rf_armor":
				return _collection.getMin() - 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_unstoppable":
				return 1.5;

			case "pg.rf_fast":
			case "pg.special.rf_student":
				return 2;

			case "pg.special.rf_back_to_basics":
				return 3;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
