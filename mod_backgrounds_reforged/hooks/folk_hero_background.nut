::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/folk_hero_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
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

	q.getPerkGroupCollectionMin = @() function( _collection )
	{
		switch (_collection.getID())
		{
			case "pgc.rf_shared_1":
				return _collection.getMin() + 2;

			case "pgc.rf_weapon":
				return _collection.getMin() + 2;

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
			case "pg.special.rf_gifted":
				return -1;

			case "pg.rf_dagger":
				return 0;

			case "pg.rf_agile":
				return 1.33;

			case "pg.rf_trained":
			case "pg.special.rf_leadership":
				return 2;

			case "pg.rf_tough":
				return 3.33;

			case "pg.rf_vigorous":
				return 3.33;			

			case "pg.rf_unstoppable":
				return 5;

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
			text = ::Reforged.Mod.Tooltips.parseString("Has access to the [Battle Fervor|Perk+perk_battle_fervor] [perk|Concept.Perk] at tier 1 of the perk tree")
		});
		return ret;
	}

	q.onBuildPerkTree <- function()
	{
		local perkTree = this.getContainer().getActor().getPerkTree();
		if (perkTree.hasPerk("perk.rf_battle_fervor"))
		{
			perkTree.removePerk("perk.rf_battle_fervor");
		}
		perkTree.addPerk("perk.rf_battle_fervor", 1);
	}
});
