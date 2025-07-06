/datum/antagonist/gene_besserict
	name = "Bène Gesserict"
	roundend_category = "gesserict"
	antagpanel_category = "Bene Gesserict"
	antag_memory = "<b>You are the spy of the Church, veiled within the royal court. Safeguard the bloodline at all costs. Should it falter - strike without hesitation. Loyalty to the Faith comes before all else.</b>"
	job_rank = ROLE_BESSERICT
	antag_hud_type = ANTAG_HUD_TRAITOR
	show_in_roundend = FALSE
	confess_lines = list(
	"I was sent to observe, not to intervene... but I failed.",
	"My sisters will carry on what I could not complete.",
	"The bloodline must be preserved, even if I perish.",
	"Yes, I shaped her thoughts. She thinks it was her will.",
	"It was I who revealed the omen to the priest.",
	)
	rogue_enabled = TRUE

	var/static/list/applied_traits = list(
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_NOSTINK,
		TRAIT_EMPATH,
		TRAIT_NOROGSTAM,
		TRAIT_STEELHEARTED,
	)

/datum/antagonist/bene_gesserict/on_gain()
	. = ..()
	if(owner.current)
		if(ishuman(owner.current))
			var/mob/living/carbon/human/bene_gesserict = owner.current
			bene_gesserict.cmode_music = 'sound/music/combat_maniac2.ogg'
			owner.adjust_skillrank(/datum/skill/combat/knives, 5, TRUE)
			owner.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			owner.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
			var/medicine_skill = bene_gesserict.mind.get_skill_level(/datum/skill/misc/medicine)
			var/holy_skill = bene_gesserict.mind.get_skill_level(/datum/skill/magic/holy)
			if(medicine_skill < 4)
				owner.adjust_skillrank(/datum/skill/misc/medicine, 4 - medicine_skill, TRUE)
			if(holy_skill < 3)
				owner.adjust_skillrank(/datum/skill/magic/holy, 3 - holy_skill, TRUE)			
