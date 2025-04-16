::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/arbalester_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [
					"pg.rf_crossbow"
				],
				"pgc.rf_armor": [],
				"pgc.rf_fighting_style": [
					"pg.rf_ranged"
				]
			}
		});
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_agile":
				return 1.25;

			case "pg.rf_vigorous":
				return 1.5;

			case "pg.rf_polearm":
				return 2;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
