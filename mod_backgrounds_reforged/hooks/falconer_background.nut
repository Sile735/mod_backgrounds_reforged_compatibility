::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/falconer_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_trapper"
				],
				"pgc.rf_shared_1": [
					"pg.rf_fast"
				],
				"pgc.rf_weapon": [],
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
			case "pg.rf_heavy_armor":
			case "pg.rf_shield":
				return 0;

			case "pg.rf_trained":
				return 0.5;

			case "pg.rf_tough":
				return 0.8;

			case "pg.rf_agile":
				return 2;

			default:
				return __original(_groupID, _perkTree);
		}
	}
});
