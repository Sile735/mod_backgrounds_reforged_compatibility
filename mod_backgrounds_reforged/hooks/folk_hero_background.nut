::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/folk_hero_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {			
			"pg.rf_agile": 1.33, 
			"pg.rf_tough": 3.33, 
			"pg.rf_trained": 2,
			"pg.rf_unstoppable": 5, 
			"pg.rf_vigorous": 3.33,
			"pg.rf_dagger": 0,
			"pg.rf_leadership": 2, 

			"pg.special.rf_gifted": -1		 				
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeOnly);
		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeSpecialist);
		
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