/datum/advclass/confessor
	name = "Confessor"
	tutorial = "Church of the Ten holy hunters, unmatched in the fields of subterfuge and investigation. There is no suspect too powerful to investigate, no room too guarded to infiltrate, and no weakness too hidden to exploit."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/confessor
	category_tags = list(CTAG_INQUISITION)
	cmode_music = 'sound/music/combat_rogue.ogg'

/datum/outfit/job/roguetown/confessor
	job_bitflag = BITFLAG_CHURCH

/datum/outfit/job/roguetown/confessor/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE) // Cudgellin - Nonlethals
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE) // Stabbin - Lethals
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) // Quick
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE) // Stitch up your prey
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)	
	// Weapon choice system
	H.adjust_blindness(-3)
	var/weapons = list("Crossbow & Bolts", "Recurve Bow & Arrows")
	var/weapon_choice = input("Choose your ranged weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Crossbow & Bolts")
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			beltr = /obj/item/quiver/bolts
		if("Recurve Bow & Arrows")
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			beltr = /obj/item/quiver/arrows

	cloak = /obj/item/clothing/suit/roguetown/armor/longcoat
	wrists = /obj/item/clothing/neck/roguetown/psicross/silver
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	beltl = /obj/item/rogueweapon/mace/cudgel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/psydon
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	shoes = /obj/item/clothing/shoes/roguetown/boots
	mask = /obj/item/clothing/mask/rogue/facemask/psydonmask
	head = /obj/item/clothing/head/roguetown/roguehood/psydon
	backpack_contents = list(/obj/item/roguekey/inquisition = 1, /obj/item/lockpickring/mundane = 1, /obj/item/rogueweapon/huntingknife/idagger/silver/psydagger, /obj/item/grapplinghook = 1)
	H.change_stat("strength", -1) // weasel
	H.change_stat("endurance", 3)
	H.change_stat("perception", 2)
	H.change_stat("speed", 3)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)		//You're a foreigner, a guest of the realm.
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = FALSE, devotion_limit = CLERIC_REQ_1)
	H.grant_language(/datum/language/otavan)
