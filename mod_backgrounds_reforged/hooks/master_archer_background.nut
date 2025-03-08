::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/master_archer_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 3, 
			"pg.rf_fast": 5, 			
			"pg.rf_tough": 0, 			
			"pg.rf_vigorous": 0.2,
			
			"pg.special.rf_leadership": 0, 	
			"pg.special.rf_marksmanship": -1		
		};
		
		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					
				],
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
			text = ::Reforged.Mod.Tooltips.parseString("Has a ranged mastery perk permanently for free")
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
				o.m.IsRefundable = false;}));				
			}
			else {
				this.getContainer().add(::Reforged.new("scripts/skills/perks/perk_mastery_crossbow", function(o) {
				o.m.IsRefundable = false;}));				
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