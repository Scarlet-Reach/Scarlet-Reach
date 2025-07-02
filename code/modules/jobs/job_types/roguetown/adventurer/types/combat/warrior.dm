/datum/advclass/sfighter
	name = "Warrior"
	tutorial = "Trained warriors and estemeed swordsmen from all corners of the world, \
	warriors are defined by martial prowess - whether with a blade or their bare fists."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_OUTLANDER)
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	classes = list("Battlemaster" = "You are a seasoned weapon specialist, clad in maille, with years of experience in warfare and battle under your belt.",
					"Duelist"= "You are an esteemed swordsman who foregoes armor in exchange for a more nimble fighting style.",
					"Barbarian" = "You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling.",
					"Monster Hunter" = "You specialize in hunting down monsters and the undead, carrying two blades - one of silver, one of steel.",
					"Flagellant" = "You are a pacifistic warrior who embraces suffering, believing pain is the path to enlightenment. You take the suffering of others upon yourself.",
					"Amazon" = "Fierce warrior women from distant lands, Amazons choose their armor based on their preferred fighting style - from light and agile to heavily protected.")

/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Battlemaster","Duelist","Barbarian","Monster Hunter","Flagellant","Amazon")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Battlemaster")
			to_chat(H, span_warning("You are a seasoned weapon specialist, clad in maille, with years of experience in warfare and battle under your belt."))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)			
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			var/weapons = list("Longsword","Mace","Billhook","Battle Axe","Short Sword & Heater Shield")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Longsword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					backr = /obj/item/rogueweapon/sword/long
				if("Mace")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
					beltr = /obj/item/rogueweapon/mace
				if("Billhook")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
					r_hand = /obj/item/rogueweapon/spear/billhook
					backr = /obj/item/gwstrap
				if("Battle Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
					backr = /obj/item/rogueweapon/stoneaxe/battle
				if("Short Sword & Heater Shield")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
					backr = /obj/item/rogueweapon/shield/heater
					beltr = /obj/item/rogueweapon/sword/iron/short
			var/armors = list("Chainmaille Set","Iron Breastplate","Gambeson & Helmet")
			var/armor_choice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
			switch(armor_choice)
				if("Chainmaille Set")
					shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
					pants = /obj/item/clothing/under/roguetown/chainlegs/iron
					neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
					gloves = /obj/item/clothing/gloves/roguetown/chain/iron
				if("Iron Breastplate")
					armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
					pants = /obj/item/clothing/under/roguetown/trou/leather
					gloves = /obj/item/clothing/gloves/roguetown/angle
				if("Gambeson & Helmet")
					shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
					pants = /obj/item/clothing/under/roguetown/trou/leather
					head = /obj/item/clothing/head/roguetown/helmet/kettle
					gloves = /obj/item/clothing/gloves/roguetown/angle
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/recipe_book/survival = 1)

		if("Duelist")
			to_chat(H, span_warning("You are an esteemed swordsman who foregoes armor in exchange for a more nimble fighting style."))
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
			H.set_blindness(0)
			H.cmode_music = 'sound/music/combat_duelist.ogg'
			var/weapons = list("Rapier","Dagger")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Rapier")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					beltr = /obj/item/rogueweapon/sword/rapier
				if("Dagger")
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
					beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			armor = /obj/item/clothing/suit/roguetown/armor/leather
			head = /obj/item/clothing/head/roguetown/duelhat
			mask = /obj/item/clothing/mask/rogue/duelmask
			cloak = /obj/item/clothing/cloak/half
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			pants = /obj/item/clothing/under/roguetown/trou/leather
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/clothing/neck/roguetown/gorget
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/buckler
			belt = /obj/item/storage/belt/rogue/leather
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife/idagger/steel/parrying = 1, /obj/item/recipe_book/survival = 1)

		if("Barbarian")
			to_chat(H, span_warning("You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling."))
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_gronn.ogg'
			H.set_blindness(0)
			var/weapons = list("Katar","Axe","Sword","Club","Spear","MY BARE HANDS!!!")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if ("Katar")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					beltr = /obj/item/rogueweapon/katar
				if("Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					beltr = /obj/item/rogueweapon/stoneaxe/boneaxe
				if("Sword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/short
				if("Club")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltr = /obj/item/rogueweapon/mace/woodclub
				if("Spear")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
					r_hand = /obj/item/rogueweapon/spear/bonespear
				if ("MY BARE HANDS!!!")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
			H.change_stat("strength", 3)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			H.change_stat("intelligence", -2)
			if(should_wear_masc_clothes(H))
				H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
				head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
				gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				beltl = /obj/item/rogueweapon/huntingknife
			if(should_wear_femme_clothes(H))
				head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
				armor = /obj/item/clothing/suit/roguetown/armor/leather/bikini
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shorts
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
				shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
				gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				beltl = /obj/item/rogueweapon/huntingknife
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)

		if("Monster Hunter")
			to_chat(H, span_warning("You specialize in hunting down monsters and the undead, carrying two blades - one of silver, one of steel."))
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/inquisitorcombat.ogg'
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("intelligence", 1)
			beltr = /obj/item/rogueweapon/sword/silver
			backr = /obj/item/rogueweapon/sword
			backl = /obj/item/storage/backpack/rogue/satchel/black
			wrists = /obj/item/clothing/neck/roguetown/psicross/silver
			armor = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/steel
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/black
			cloak = /obj/item/clothing/cloak/cape/puritan
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			head = /obj/item/clothing/head/roguetown/bucklehat
			gloves = /obj/item/clothing/gloves/roguetown/angle
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/recipe_book/survival = 1)
			beltl = pick(/obj/item/reagent_containers/glass/bottle/alchemical/strpot, 
						/obj/item/reagent_containers/glass/bottle/alchemical/conpot, 
						/obj/item/reagent_containers/glass/bottle/alchemical/endpot,
						/obj/item/reagent_containers/glass/bottle/alchemical/spdpot,
						/obj/item/reagent_containers/glass/bottle/alchemical/perpot,
						/obj/item/reagent_containers/glass/bottle/alchemical/intpot,
						/obj/item/reagent_containers/glass/bottle/alchemical/lucpot)

		if("Flagellant")
			to_chat(H, span_warning("You are a pacifistic warrior who embraces suffering, believing pain is the path to enlightenment. You take the suffering of others upon yourself."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.set_blindness(0)
			
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_PACIFISM, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC) 
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_IGNORESLOWDOWN, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
			
			H.change_stat("constitution", 15)
			H.change_stat("intelligence", -2)
			H.change_stat("perception", -2)
			H.change_stat("endurance", -2)
			H.change_stat("strength", -2)
			
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/damage_transfer)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/affliction_transfer)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/damage_link)
			
			pants = /obj/item/clothing/under/roguetown/tights/black
			shirt = /obj/item/clothing/suit/roguetown/shirt/tunic
			backl = /obj/item/storage/backpack/rogue/satchel   
			belt = /obj/item/storage/belt/rogue/leather        
			beltr = /obj/item/rogueweapon/whip
			backpack_contents = list(/obj/item/recipe_book/survival = 1)            

		if("Amazon")
			to_chat(H, span_warning("Fierce warrior women from distant lands, Amazons choose their armor based on their preferred fighting style - from light and agile to heavily protected."))
			var/armor_styles = list("Leather Kini","Hide Armor Kini","Studded Leather Kini","Half Plate Kini","Plate Kini")
			var/armor_choice = input("Choose your armor style", "Available armor styles") as anything in armor_styles

			switch(armor_choice)

				if("Leather Kini")
					to_chat(H, span_warning("You are a swift and agile warrior who relies on speed and evasion. Your light leather armor allows for maximum mobility."))
					H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
					ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
					H.set_blindness(0)
					H.change_stat("speed", 3)
					H.change_stat("endurance", 1)
					H.change_stat("strength", 1)
					armor = /obj/item/clothing/suit/roguetown/armor/leather/bikini
					pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shorts
					wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
					shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
					gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
					backl = /obj/item/storage/backpack/rogue/satchel
					belt = /obj/item/storage/belt/rogue/leather
					neck = /obj/item/storage/belt/rogue/pouch/coins/poor
					beltr = /obj/item/rogueweapon/whip
					backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1)

				if("Hide Armor Kini")
					to_chat(H, span_warning("You are a swift and agile warrior who relies on speed and evasion. Your light leather armor allows for maximum mobility."))
					H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
					ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
					H.set_blindness(0)
					H.change_stat("speed", 3)
					H.change_stat("endurance", 1)
					H.change_stat("strength", 1)
					armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini
					pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shorts
					wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
					shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
					gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
					backl = /obj/item/storage/backpack/rogue/satchel
					belt = /obj/item/storage/belt/rogue/leather
					neck = /obj/item/storage/belt/rogue/pouch/coins/poor
					beltr = /obj/item/rogueweapon/whip
					backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1)

				if("Studded Leather Kini")
					to_chat(H, span_warning("You are a refined warrior who combines light protection with precision strikes using a rapier."))
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
					ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
					H.set_blindness(0)
					H.change_stat("speed", 2)
					H.change_stat("endurance", 1)
					H.change_stat("strength", 2)
					armor = /obj/item/clothing/suit/roguetown/armor/leather/studded/bikini
					pants = /obj/item/clothing/under/roguetown/tights/black
					wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
					shoes = /obj/item/clothing/shoes/roguetown/boots
					gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
					backl = /obj/item/storage/backpack/rogue/satchel
					belt = /obj/item/storage/belt/rogue/leather
					neck = /obj/item/storage/belt/rogue/pouch/coins/poor
					beltr = /obj/item/rogueweapon/sword/rapier
					backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife/idagger/steel = 1)

				if("Half Plate Kini")
					to_chat(H, span_warning("You are a balanced warrior who wears medium armor and wields a powerful axe for devastating strikes."))
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)			
					H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
					ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
					ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC)
					H.set_blindness(0)
					H.change_stat("strength", 2)
					H.change_stat("endurance", 2)
					H.change_stat("constitution", 1)
					armor = /obj/item/clothing/suit/roguetown/armor/plate/bikini
					pants = /obj/item/clothing/under/roguetown/trou/leather
					wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
					shoes = /obj/item/clothing/shoes/roguetown/boots
					gloves = /obj/item/clothing/gloves/roguetown/angle
					backl = /obj/item/storage/backpack/rogue/satchel
					belt = /obj/item/storage/belt/rogue/leather
					neck = /obj/item/storage/belt/rogue/pouch/coins/poor
					beltr = /obj/item/rogueweapon/stoneaxe/battle
					backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/recipe_book/survival = 1)

				if("Plate Kini")
					to_chat(H, span_warning("You are a heavily armored juggernaut who can withstand tremendous punishment while crushing enemies with a mace."))
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)			
					H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
					H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
					ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
					H.set_blindness(0)
					H.change_stat("strength", 3)
					H.change_stat("constitution", 3)
					H.change_stat("speed", -1)
					armor = /obj/item/clothing/suit/roguetown/armor/plate/full/bikini
					pants = /obj/item/clothing/under/roguetown/trou/leather
					wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
					shoes = /obj/item/clothing/shoes/roguetown/boots
					gloves = /obj/item/clothing/gloves/roguetown/angle
					backl = /obj/item/storage/backpack/rogue/satchel
					belt = /obj/item/storage/belt/rogue/leather
					neck = /obj/item/storage/belt/rogue/pouch/coins/poor
					beltr = /obj/item/rogueweapon/mace
					backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/recipe_book/survival = 1)
