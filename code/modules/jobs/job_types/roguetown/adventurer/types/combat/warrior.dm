/datum/advclass/sfighter
	name = "Warrior"
	tutorial = "Trained warriors and estemeed swordsmen from all corners of the world, \
	warriors are defined by martial prowess - whether with a blade or their bare fists."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_OUTLANDER)
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	classes = list("Fighter" = "Vagrant sellswords, deserters, and hardened vagabonds searching for purpose. Very few survive this life...many dying from their own foolish or desperate attempts at survival. Who will you be?",
					"Duelist"= "You are an esteemed swordsman who foregoes armor in exchange for a more nimble fighting style.",
					"Barbarian" = "You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling.",
					"Monster Hunter" = "You specialize in hunting down monsters and the undead, carrying two blades - one of silver, one of steel.",
					"Flagellant" = "You are a pacifistic warrior who embraces suffering, believing pain is the path to enlightenment. You take the suffering of others upon yourself.",
					"Amazon" = "Fierce warrior women from distant lands, Amazons choose their armor based on their preferred fighting style - from light and agile to heavily protected.")

/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Fighter","Duelist","Barbarian","Monster Hunter","Flagellant","Amazon")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Fighter")
			to_chat(H, span_warning("Vagrant sellswords, deserters, and hardened vagabonds searching for purpose. Very few survive this life...many dying from their own foolish or desperate attempts at survival. Who will you be?"))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			var/weapons = list("Iron Sword","Mace","Spear","Axe")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Iron Sword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/iron
				if("Mace")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltr = /obj/item/rogueweapon/mace
				if("Spear")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
					backr = /obj.item/gwstrap
					r_hand = /obj/item/rogueweapon/spear
				if("Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					beltr = /obj/item/rogueweapon/stoneaxe/woodcut
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson/light
			pants = /obj/item/clothing/under/roguetown/trou
			gloves = /obj/item/clothing/gloves/roguetown/leather
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1)

		if("Duelist")
			to_chat(H, span_warning(" A thrill seeking swordsmen who foregoes armor in exchange for a more nimble fighting style."))
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
			var/weapons = list("Sabre","Dagger")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Sabre")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/sabre
				if("Dagger")
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
					beltr = /obj/item/rogueweapon/huntingknife/idagger
					beltl = /obj/item/rogueweapon/huntingknife/idagger
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			head = /obj/item/clothing/head/roguetown/brimmed
			armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/tanned
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/otavan
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1,/obj/item/storage/belt/rogue/pouch/coins/poor)
                
		if("Barbarian")
			to_chat(H, span_warning("You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling."))
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_steppe.ogg'
			H.set_blindness(0)
			var/weapons = list("Katar","Steel Duster","Axe","MY BARE HANDS!!!")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if ("Katar")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					beltr = /obj/item/rogueweapon/katar
				if ("Steel Duster")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					beltr = /obj/item/rogueweapon/knuckles
				if("Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					beltr = /obj/item/rogueweapon/stoneaxe/boneaxe
				if ("MY BARE HANDS!!!")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
			H.change_stat("strength", 3)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			H.change_stat("intelligence", -2)
			H.change_stat("speed", -3)
			if(H.pronouns == HE_HIM || H.pronouns == THEY_THEM || H.pronouns == IT_ITS)
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
			if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
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
