// PSY'S TRUTH IS BLINDING

/obj/effect/proc_holder/spell/invoked/elucidate
	name = "Elucidate"
	overlay_state = "limb_attach"
	desc = "The Agonizing Truth of the Martyr causes a temporary seizure of the senses."
	recharge_time = 10 SECONDS
	chargetime = 0 SECONDS
	chargedrain = 0 SECONDS
	movement_interrupt = FALSE
	warnie = "sydwarning"
	associated_skill = /datum/skill/magic/holy
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/antimagic.ogg'
	invocation = "PSYDON! UNVEIL THE TRUTH!"
	invocation_type = "shout"
	antimagic_allowed = TRUE
	miracle = TRUE
	devotion_cost = 10

/obj/effect/proc_holder/spell/invoked/elucidate/cast(list/targets, mob/user = usr)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(istype(target.patron, /datum/patron/old_god)) //We don't target our brothers
			return FALSE
		target.visible_message(span_warning("[user] elucidates [target]!"),span_warning("I HAVE BEEN ILLUMINATED!"))
		target.apply_status_effect(/datum/status_effect/elucidated)
		var/list/sounds = list(
		'sound/villain/hall_attack1.ogg',
		'sound/villain/hall_attack2.ogg',
		'sound/villain/hall_attack3.ogg',
		'sound/villain/hall_attack4.ogg',
		)
		target.playsound_local(target, pick(sounds), vol = 100, vary = FALSE)
		if(alert(target, "Do you accept the Truth of PSYDON?", "JUDGEMENT", "Yes", "No") == "Yes")
			target.set_patron(/datum/patron/old_god)
		return TRUE
	revert_cast()
	return FALSE



/datum/status_effect/elucidated
	id = "elucidated"
	alert_type = /atom/movable/screen/alert/status_effect/elucidated
	status_type = STATUS_EFFECT_UNIQUE
	duration = 15 SECONDS

/datum/status_effect/elucidated/on_apply()
	owner.overlay_fullscreen("elucidated", /atom/movable/screen/fullscreen/psydon)

/datum/status_effect/elucidated/on_remove()
	owner.clear_fullscreen("elucidated")


/atom/movable/screen/alert/status_effect/elucidated
	name = "TRUTH"
	desc = "No... IT CAN'T BE!"
	icon_state = "stressvb"

/obj/effect/proc_holder/spell/targeted/churn/psychurn
	name = "Churn Undead"
	overlay_state = "limb_attach"
	invocation = "Psydon HATES you!"
