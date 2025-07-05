// Wretch, soft antagonists. Giving them 9 points as stat (matching mercs) on average since they're a driving antagonist on AP or assistant antagonist. 
/datum/job/roguetown/wretch
	title = "Wretch"
	flag = WRETCH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	allowed_races = RACES_ALL_KINDS
	tutorial = "Somewhere in your lyfe, you fell to the wrong side of civilization. Hounded by the consequences of your actions, you now threaten the peace of those who still heed the authority that condemned you."
	outfit = null
	outfit_female = null
	display_order = JDO_WRETCH
	show_in_credits = FALSE
	min_pq = 20
	max_pq = null

	advclass_cat_rolls = list(CTAG_WRETCH = 20)
	PQ_boost_divider = 10
	round_contrib_points = 2

	announce_latejoin = FALSE
	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE
	same_job_respawn_delay = 1 MINUTES

/datum/job/roguetown/wretch/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

		if(GLOB.adventurer_hugbox_duration)
			addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_start)), 1)

// Proc for wretch to select a bounty and supernatural affliction
/proc/wretch_select_bounty(mob/living/carbon/human/H)
	// First select supernatural affliction
	var/affliction = input(H, "What supernatural curse afflicts you? (\"None\" grants +1 to all stats, \"Vampire\" and \"Werewolf\" give -1 to all stats)", "Supernatural Affliction") as null|anything in list("None (+1 to all stats)", "Vampire (-1 to all stats)", "Werewolf (-1 to all stats)")
	
	switch(affliction)
		if("Vampire (-1 to all stats)")
			var/datum/antagonist/vampire/lesser/antag = H.mind.add_antag_datum(/datum/antagonist/vampire/lesser)
			if(antag)
				var/mob/living/carbon/human/Hh = H
				if(istype(Hh))
					antag.cache_skin = Hh.skin_tone
					antag.cache_eyes = Hh.eye_color
					antag.cache_hair = Hh.hair_color
				antag.wretch_antag = TRUE
				antag.vitae = 5000 // Ensure vitae pool is set for wretch vampires
				antag.owner = H.mind
				H.verbs |= /mob/living/carbon/human/proc/disguise_button
				H.verbs |= /mob/living/carbon/human/proc/vamp_regenerate
				to_chat(H, span_danger("The thirst for blood burns within you, but you are merely one of many cursed with vampirism."))
				// Add all vampire traits to wretch vampires
				ADD_TRAIT(H, TRAIT_STRONGBITE, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_NOHUNGER, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_NOBREATH, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_NOROGSTAM, TRAIT_GENERIC)
				// Apply -1 to all stats
				H.change_stat("strength", -1)
				H.change_stat("perception", -1)
				H.change_stat("intelligence", -1)
				H.change_stat("constitution", -1)
				H.change_stat("endurance", -1)
				H.change_stat("speed", -1)
				H.change_stat("fortune", -1)
		if("Werewolf (-1 to all stats)")
			var/datum/antagonist/werewolf/lesser/antag = H.mind.add_antag_datum(/datum/antagonist/werewolf/lesser)
			if(antag)
				antag.wretch_antag = TRUE
				antag.owner = H.mind
				to_chat(H, span_danger("The beast within yearns to be free. Your lycanthropic curse has made you a danger to all."))
				// Apply -1 to all stats
				H.change_stat("strength", -1)
				H.change_stat("perception", -1)
				H.change_stat("intelligence", -1)
				H.change_stat("constitution", -1)
				H.change_stat("endurance", -1)
				H.change_stat("speed", -1)
				H.change_stat("fortune", -1)
		if("None (+1 to all stats)")
			// Apply +1 to all stats
			H.change_stat("strength", 1)
			H.change_stat("perception", 1)
			H.change_stat("intelligence", 1)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 1)
			H.change_stat("fortune", 1)
	
	// Then proceed with normal bounty selection
	var/bounty_poster = input(H, "Who placed a bounty on you?", "Bounty Poster") as anything in list("The Justiciary of Scarlet Reach", "The Grenzelhoftian Holy See", "The Otavan Holy See")
	if(bounty_poster == "The Justiciary of Scarlet Reach")
		GLOB.outlawed_players += H.real_name
	else
		GLOB.excommunicated_players += H.real_name
	// Felinid said we should gate it at 100 or so on at the lowest, so that wretch cannot ezmode it.
	var/bounty_severity = input(H, "How severe are your crimes?", "Bounty Amount") as anything in list("Misdeed", "Harm towards lyfe", "Horrific atrocities")
	var/bounty_total = rand(350, 500) // Just in case
	switch(bounty_severity)
		if("Misdeed")
			bounty_total = rand(130, 200)
		if("Harm towards lyfe")
			bounty_total = rand(200, 350)
			H.change_stat("intelligence", 1)
		if("Horrific atrocities")
			bounty_total = rand(350, 500) // Let's not make it TOO profitable
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("intelligence", 1)
	var/my_crime = input(H, "What is your crime?", "Crime") as text|null
	if (!my_crime)
		my_crime = "crimes against the Crown"
	add_bounty(H.real_name, bounty_total, FALSE, my_crime, bounty_poster)
	to_chat(H, span_danger("You are an Antagonistic role. You are expected, by choosing to be a wretch, to sow chaos and division amongst the town while driving a story. Failure to use proper gravitas for this may get you punished for Low Role Play standards."))