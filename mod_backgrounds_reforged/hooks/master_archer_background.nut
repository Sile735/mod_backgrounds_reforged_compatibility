::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/master_archer_background", function(q) {
	q.createPerkTreeBlueprint = @() function()
	{
		return ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [],
				"pgc.rf_shared_1": [
					"pg.rf_trained"
				],
				"pgc.rf_weapon": [
					"pg.rf_bow",
					"pg.rf_crossbow",
					"pg.rf_throwing"
				],
				"pgc.rf_armor": [
					"pg.rf_light_armor",
					"pg.rf_medium_armor"
				],
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
			case "pg.special.rf_marksmanship":
				return -1;

			case "pg.special.rf_leadership":
			case "pg.rf_tough":
				return 0;

			case "pg.rf_vigorous":
				return 0.2;

			case "pg.rf_agile":
				return 3;

			case "pg.rf_fast":
				return 5;

			default:
				return __original(_groupID, _perkTree);
		}
	}

	q.getPerkGroupCollectionMin = @() function( _collection )
	{
		switch (_collection.getID())
		{
			case "pgc.rf_shared_1":
				return _collection.getMin() + 1;

			case "pgc.rf_fighting_style":
				return _collection.getMin() - 1;
		}
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = ::Reforged.Mod.Tooltips.parseString("Has either [Bow Mastery|Perk+perk_mastery_bow] or [Crossbow Mastery|Perk+perk_mastery_crossbow] permanently for free")
		});
		return ret;
	}

	q.onAdded = @(__original) function()
	{
		if (this.m.IsNew)
		{
			local r = Math.rand(1, 100)
			if (r <= 50){
				this.getContainer().add(::Reforged.new("scripts/skills/perks/perk_mastery_bow", function(o) {
					o.m.IsRefundable = false;
				}));
			}
			else {
				this.getContainer().add(::Reforged.new("scripts/skills/perks/perk_mastery_crossbow", function(o) {
					o.m.IsRefundable = false;
				}));
			}
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
