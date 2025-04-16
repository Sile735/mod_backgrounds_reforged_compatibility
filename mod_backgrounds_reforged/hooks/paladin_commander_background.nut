::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/paladin_commander_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_soldier"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [],
				"pgc.rf_armor": [
					"pg.rf_heavy_armor"
				],
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
				return _collection.getMin() + 2;

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
			case "pg.special.rf_back_to_basics":
			case "pg.special.rf_professional":
				return -1;

			case "pg.special.rf_leadership":
			case "pg.rf_tactician":
			case "pg.rf_vicious":
			case "pg.rf_dagger":
			case "pg.rf_polearm":
			case "pg.rf_light_armor":
				return 0;

			case "pg.rf_agile":
				return 0.5;

			case "pg.rf_fast":
				return 0.25;

			case "pg.rf_trained":
				return 4;

			case "pg.rf_tough":
				return 5;

			case "pg.rf_unstoppable":
				return 7;

			case "pg.rf_vigorous":
				return 8;

			default:
				return __original(_groupID, _perkTree);
		}
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = ::Reforged.Mod.Tooltips.parseString("Has the [Exude Confidence|Perk+perk_rf_exude_confidence] [perk|Concept.Perk] permanently for free")
		});
		return ret;
	}

	q.onAdded = @(__original) function()
	{
		if (this.m.IsNew)
		{
			this.getContainer().add(::Reforged.new("scripts/skills/perks/perk_rf_exude_confidence", function(o) {
				o.m.IsRefundable = false;
			}));
		}
		return __original();
	}
});
