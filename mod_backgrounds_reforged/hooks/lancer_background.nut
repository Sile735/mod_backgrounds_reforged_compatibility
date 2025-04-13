::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/lancer_background", function(q) {
	q.create = @(__original) function()
	{
		__original();

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_soldier"
				],
				"pgc.rf_shared_1": [],
				"pgc.rf_weapon": [
					"pg.rf_polearm",
					"pg.rf_spear"
				],
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
				return _collection.getMin() + 2;
		}
	}

	q.getPerkGroupMultiplier = @(__original) function( _groupID, _perkTree )
	{
		if (::Reforged.Skills.getPerkGroupMultiplier_MeleeOnly(_groupID, _perkTree) == 0)
			return 0;

		switch(_groupID)
		{
			case "pg.rf_cleaver":
			case "pg.rf_dagger":
			case "pg.rf_sword":
				return 0;
			case "pg.rf_throwing":
				return 0;

			case "pg.rf_agile":
				return 1.5;

			case "pg.rf_fast":
			case "pg.rf_unstoppable":
			case "pg.rf_vicious":
				return 2;

			case "pg.rf_vigorous":
				return 2.5;

			case "pg.special.rf_leadership":
				return 4;

			case "pg.rf_tactician":
				return 7.5;

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
			text = ::Reforged.Mod.Tooltips.parseString("Has the [Polearm Mastery|Perk+perk_mastery_polearm] [perk|Concept.Perk] permanently for free")
		});
		return ret;
	}

	q.onAdded = @(__original) function()
	{
		if (this.m.IsNew)
		{
			this.getContainer().add(::Reforged.new("scripts/skills/perks/perk_mastery_polearm", function(o) {
				o.m.IsRefundable = false;
			}));
		}
		return __original();
	}

	q.onBuildPerkTree <- function()
	{
		local perkTree = this.getContainer().getActor().getPerkTree();
		if (perkTree.hasPerk("perk.rf_professional"))
		{
			perkTree.removePerk("perk.rf_professional");
		}
	}
});
