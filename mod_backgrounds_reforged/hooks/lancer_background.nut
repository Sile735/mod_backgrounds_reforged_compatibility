::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/lancer_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 1.5, 
			"pg.rf_fast": 2, 			
			"pg.rf_unstoppable": 2, 
			"pg.rf_vicious": 2,			
			"pg.rf_vigorous": 2.5,
			"pg.rf_cleaver": 0, 
			"pg.rf_dagger": 0, 
			"pg.rf_sword": 0, 
			"pg.rf_throwing": 0, 

			"pg.special.rf_leadership": 4, 			
			"pg.rf_tactician": 7.5			
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeOnly);
		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeSpecialist);
		
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

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = ::Reforged.Mod.Tooltips.parseString("Has the [Polearm Mastery|Perk+perk_mastery_polearm] perk permanently for free")
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