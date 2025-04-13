::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/champion_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
				"pgc.rf_shared_1": [
					"pg.rf_tactician",
					"pg.rf_trained"
				],
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
				return _collection.getMin() + 2;

			case "pgc.rf_weapon":
				return _collection.getMin() + 3;

			case "pgc.rf_fighting_style":
				return _collection.getMin() + 1;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		if (::Reforged.Skills.getPerkGroupMultiplier_MeleeOnly(_groupID, _perkTree) == 0)
			return 0;

		switch(_groupID)
		{
			case "pg.special.rf_professional":
				return -1;

			case "pg.rf_fast":
			case "pg.rf_vicious":
				return 2.5;
			case "pg.rf_dagger":
				return 0;

			case "pg.rf_agile":
				return 1.5;

			case "pg.rf_vigorous":
				return 2;

			case "pg.rf_unstoppable":
				return 2.5;

			case "pg.rf_tough":
				return 3;

			case "pg.special.rf_leadership":
				return 10;

			case "pg.special.rf_back_to_basics":
				return 12;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
