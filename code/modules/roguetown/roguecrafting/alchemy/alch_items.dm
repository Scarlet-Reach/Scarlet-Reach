/obj/item/reagent_containers/glass/bottle/alchemical
	name = "alchemical vial"
	desc = "A cute bottle that can hold three swigs of liquid, which is useful for both miserly business practices and preventing accidental overdosing. This one lacks a cork."
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "vial_bottle"
	amount_per_transfer_from_this = 9
	amount_per_gulp = 9
	possible_transfer_amounts = list(9)
	volume = 27
	fill_icon_thresholds = list(0, 33, 66, 100)
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH
	obj_flags = CAN_BE_HIT|UNIQUE_RENAME
	w_class = WEIGHT_CLASS_TINY
	experimental_onhip = FALSE
	experimental_inhand = FALSE
	sellprice = 1

// Shitty copy paste override until bottle code refactored
/obj/item/reagent_containers/glass/bottle/alchemical/update_icon(dont_fill=FALSE)
	if(!fill_icon_thresholds || dont_fill)
		return

	cut_overlays()
	underlays.Cut()

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance(icon)

		var/percent = round((reagents.total_volume / volume) * 100)
		for(var/i in 1 to fill_icon_thresholds.len)
			var/threshold = fill_icon_thresholds[i]
			var/threshold_end = (i == fill_icon_thresholds.len)? INFINITY : fill_icon_thresholds[i+1]
			if(threshold <= percent && percent < threshold_end)
				filling.icon_state = "vial_fluid_[fill_icon_thresholds[i]]"
		filling.alpha = mix_alpha_from_reagents(reagents.reagent_list)
		filling.color = mix_color_from_reagents(reagents.reagent_list)
		underlays += filling

	if(closed)
		add_overlay("vial_cork")

//Love potion - Charged Pink
/obj/item/lovepotion
	name = "love potion"
	desc = "A pink potion with a faintly sweet and fruity aroma emanating from the bottle. The label reads \"Love Potion\" and says it will make nearly anyone desire you."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "lovebottle"

/obj/item/lovepotion/attack(mob/living/carbon/human/M, mob/user)
	if(!isliving(M) || M.stat == DEAD)
		to_chat(user, span_warning("A love potion can only be metabolized by living beings. I'd best not waste it!"))
		return ..()
	if(user == M)
		to_chat(user, span_warning("It's too risky to consume this potion myself. Instead, I should feed it to someone I desire!"))
		return ..()
	if(M.has_status_effect(STATUS_EFFECT_INLOVE))
		to_chat(user, span_warning("[M] is already consumed by obsession for someone else!"))
		return ..()

	M.visible_message(span_danger("[user] starts to feed [M] a love potion!"),
		span_danger("[user] starts to feed you a love potion!"))

	if(!do_after(user, 50, target = M))
		return
	to_chat(user, span_notice("I feed [M] the love potion!"))
	to_chat(M, span_notice("I taste strawberries as the potion pours down my throat. My heart pounds against my chest as my mind becomes clouded with thoughts of [user]. Be this true love or be this obsession, it matters not. For I will have [user]."))
	if(M.mind)
		M.mind.store_memory("You are obsessed with [user].")
		M.mind.add_special_person(user, "#FFC0CB")
	M.faction |= "[REF(user)]"
	M.apply_status_effect(STATUS_EFFECT_INLOVE, user)
	qdel(src)
