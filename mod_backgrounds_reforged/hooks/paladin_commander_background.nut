::modBR.HooksMod.hook("scripts/skills/backgrounds/hackflows/paladin_commander_background", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeMultipliers = {
			"pg.rf_agile": 0.5, 
			"pg.rf_fast": 0.25,
			"pg.rf_tactician": 0,
			"pg.rf_tough": 5, 
			"pg.rf_trained": 4,
			"pg.rf_unstoppable": 7,
			"pg.rf_vicious": 0,
			"pg.rf_vigorous": 8, 
			"pg.rf_dagger": 0, 
			"pg.rf_polearm": 0, 
			"pg.rf_light_armor": 0
			
			"pg.special.rf_leadership": 0,

			"pg.rf_back_to_basics": -1,
			"pg.special.rf_professional": -1,
			"pg.rf_back_to_basics": -1
		};

		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeOnly);
		::MSU.Table.merge(this.m.PerkTreeMultipliers, ::Reforged.Skills.PerkTreeMultipliers.MeleeSpecialist);

		this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
			DynamicMap = {
				"pgc.rf_exclusive_1": [
					"pg.rf_soldier"
				],
				"pgc.rf_shared_1": [
					
				],
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

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = ::Reforged.Mod.Tooltips.parseString("Has the [Exude Confidence |Perk+perk_rf_exude_confidence] perk permanently for free")
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