::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/barkeep_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
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

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		switch(_groupID)
		{
			case "pg.rf_fast":
			case "pg.rf_swift_strikes":
				return 0.5;

			case "pg.rf_trained":
				return 1.5;

			case "pg.rf_tough":
				return 2;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
