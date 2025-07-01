/obj/effect/proc_holder/spell/self/recall
	name = "Recall"
	desc = "Memorize your current location, allowing you to return to it after a delay."
	school = "transmutation"
	charge_type = "recharge"
	recharge_time = 3 MINUTES
	clothes_req = FALSE
	cost = 2
	spell_tier = 2
	invocation = "There's no place like home!"
	invocation_type = "whisper"
	cooldown_min = 3 MINUTES
	associated_skill = /datum/skill/magic/arcane
	xp_gain = TRUE
	action_icon_state = "spell0"

	var/turf/marked_location = null
	var/recall_delay = 10 SECONDS

/obj/effect/proc_holder/spell/self/recall/cast(mob/user = usr)
	if(!istype(user, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = user

	// First cast - mark the location
	if(!marked_location)
		var/turf/T = get_turf(H)
		marked_location = T
		to_chat(H, span_notice("You attune yourself to this location. Future casts will return you here."))
		start_recharge()
		revert_cast()
		return TRUE

	// Subsequent casts - begin channeling
	H.visible_message(span_warning("[H] closes [H.p_their()] eyes and begins to focus intently..."))
	if(do_after(H, recall_delay, target = H, progress = TRUE))
		// Get any grabbed mobs
		var/list/to_teleport = list(H)
		if(H.pulling && isliving(H.pulling))
			to_teleport += H.pulling

		// Teleport caster and grabbed mob if any
		for(var/mob/living/L in to_teleport)
			do_teleport(L, marked_location, no_effects = FALSE, channel = TELEPORT_CHANNEL_MAGIC)

		H.visible_message(span_warning("[H] vanishes in a swirl of energy!"))
		playsound(H, 'sound/magic/unmagnet.ogg', 50, TRUE)

		// Visual effects at both locations
		var/datum/effect_system/smoke_spread/smoke = new
		smoke.set_up(3, marked_location)
		smoke.start()
		start_recharge()
	else
		to_chat(H, span_warning("Your concentration was broken!"))
		start_recharge()
		revert_cast()
