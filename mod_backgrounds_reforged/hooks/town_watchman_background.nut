::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/town_watchman_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_militia"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": []
			}
		});
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.special.rf_leadership":
				return 0.225;

			case "pg.rf_fast":
			case "pg.rf_tough":
				return 1.25;

			case "pg.rf_vigorous":
				return 2;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
