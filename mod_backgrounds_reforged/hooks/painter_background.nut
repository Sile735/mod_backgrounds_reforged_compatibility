::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/painter_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
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

			case "pgc.rf_armor":
				return _collection.getMin() - 1;

			case "pgc.rf_shared_1":
				return _collection.getMin() + 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_tough":
				return 0.33;

			case "pg.rf_fast":
				return 1.25;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
