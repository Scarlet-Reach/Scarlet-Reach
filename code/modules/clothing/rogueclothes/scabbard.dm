/obj/item/scabbard
	name = "simple scabard"
	desc = ""

	icon_state = "simplescabbard"
	item_state = "simplescabbard"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'

	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	possible_item_intents = list(SHIELD_BASH, SHIELD_BLOCK)
	sharpness = IS_BLUNT
	wlength = WLENGTH_SHORT
	resistance_flags = FLAMMABLE
	can_parry = TRUE
	wdefense = 10
	parrysound = "parrywood"
	attacked_sound = "parrywood"
	max_integrity = 150
	blade_dulling = DULLING_BASHCHOP
	anvilrepair = /datum/skill/craft/blacksmithing
	sellprice = 3
	COOLDOWN_DECLARE(shield_bang)
	w_class = WEIGHT_CLASS_BULKY
	associated_skill = /datum/skill/combat/shields
	force = 15

	var/obj/item/rogueweapon/sword/valid_sword = /obj/item/rogueweapon/sword
	var/obj/item/rogueweapon/sword/sheathed
	var/sheathe_time = 0.1 SECONDS
	var/spawn_with = FALSE

/obj/item/scabbard/Initialize()
	..()
	if(spawn_with)
		sheathed = new valid_sword(src)

	update_icon()

/obj/item/scabbard/attack_turf(turf/T, mob/living/user)
	to_chat(user, span_notice("I search for my sword..."))
	for(var/obj/item/rogueweapon/sword/sword in T.contents)
		if(eatsword(user, sword))
			break

	..()

/obj/item/scabbard/proc/eatsword(mob/living/user, obj/A)
	if(obj_broken)
		user.visible_message(
			span_warning("[user] begins to force [A] into [src]!"),
			span_warningbig("I begin to force [A] into [src].")
		)
		if(!do_after(user, 2 SECONDS))
			return FALSE
	if(!istype(A, valid_sword))
		to_chat(user, span_warning("[A] won't fit in there.."))
		return FALSE
	if(sheathed)
		to_chat(user, span_warning("The sheath is occupied!"))
		return FALSE
	if(!do_after(user, sheathe_time))
		return FALSE

	A.forceMove(src)
	sheathed = A
	update_icon()

	user.visible_message(
		span_notice("[user] sheathes [A] into [src]."),
		span_notice("I sheathe my sword into [src].")
	)
	return TRUE

/obj/item/scabbard/proc/pukesword(mob/living/user)
	if(!sheathed)
		return FALSE
	if(obj_broken)
		user.visible_message(
			span_warning("[user] begins to force [sheathed] out of [src]!"),
			span_warningbig("I begin to force [sheathed] out of [src].")
		)
		if(!do_after(user, 2 SECONDS))
			return FALSE
	if(!do_after(user, sheathe_time))
		return FALSE

	sheathed.forceMove(user.loc)
	user.put_in_hands(sheathed)
	sheathed = null
	update_icon()

	user.visible_message(
		span_warning("[user] draws out of [src]!"),
		span_notice("I draw out [src].")
	)
	return TRUE

/obj/item/scabbard/attack_right(mob/user)
	if(sheathed)
		pukesword(user)

	..()

/obj/item/scabbard/attackby(obj/item/I, mob/user, params)
	if(istype(I, valid_sword))
		eatsword(user, I)

	..()

/obj/item/scabbard/examine(mob/user)
	..()
	if(sheathed)
		. += span_notice("The sheath is occupied by [sheathed].")

/obj/item/scabbard/update_icon()
	if(sheathed)
		icon_state = "[initial(icon_state)]1"
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/scabbard/getonmobprop(tag) //NEEDS ADJUSTMENTS
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = -1,"nx" = 6,"ny" = -1,"wx" = 0,"wy" = -2,"ex" = 0,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 1,"sflip" = 0,"wflip" = 1,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.6,"sx" = 1,"sy" = 4,"nx" = 1,"ny" = 2,"wx" = 3,"wy" = 3,"ex" = 0,"ey" = 2,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)


//MULYEOG


/obj/item/scabbard/mulyeog //Empty scabbard.
	name = "simple scabbard"
	desc = "A piece of steel lined with wood. Great for batting away blows."
	icon_state = "simplescab"
	item_state = "simplescab"
	valid_sword = /obj/item/rogueweapon/sword/sabre/mulyeog

/obj/item/scabbard/rumahench
	name = "lenticular scabbard"
	desc = "A cloud-patterned scabard with a cloth sash. Used for blocking."
	icon_state = "steelscab"
	item_state = "steelscab"
	valid_sword = /obj/item/rogueweapon/sword/sabre/mulyeog/rumahench

/obj/item/scabbard/rumacaptain
	name = "gold-stained scabbard"
	desc = "An ornate, wooden scabbard with a sash. Great for parrying."
	icon_state = "goldscab"
	item_state = "goldscab"
	valid_sword = /obj/item/rogueweapon/sword/sabre/mulyeog/rumacaptain
