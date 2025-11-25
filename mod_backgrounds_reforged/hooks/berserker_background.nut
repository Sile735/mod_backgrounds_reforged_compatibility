::Reforged.HooksMod.hook("scripts/skills/backgrounds/hackflows/berserker_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_wildling"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": [
					"pg.rf_power"
				]
			}
		});
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		if (::Reforged.Skills.getPerkGroupMultiplier_MeleeOnly(_groupID, _perkTree) == 0)
			return 0;

		switch(_groupID)
		{
			case "pg.rf_agile":
			case "pg.rf_fast":
			case "pg.rf_tactician":
			case "pg.rf_trained":
			case "pg.rf_dagger":
			case "pg.rf_spear":
			case "pg.rf_polearm":
			case "pg.special.rf_leadership":
				return 0;

			case "pg.rf_sword":
				return 0;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
