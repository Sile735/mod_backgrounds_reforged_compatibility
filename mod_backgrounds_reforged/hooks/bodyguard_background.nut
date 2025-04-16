::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/bodyguard_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
				"pgc.rf_shared_1": [
					"pg.rf_trained"
				],
				"pgc.rf_weapon": [],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": [
					"pg.rf_shield"
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

			case "pgc.rf_armor":
				return _collection.getMin() + 1;

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
				return 0;

			case "pg.rf_agile":
			case "pg.rf_tactician":
				return 2;

			case "pg.rf_tough":
				return 3;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
