/datum/round_event_control/antagonist/solo/gene_besserict
	name = "Gène Besserict"
	antag_flag = ROLE_BESSERICT
	antag_datum = /datum/antagonist/gene_besserict
	roundstart = TRUE
	shared_occurence_type = SHARED_MINOR_THREAT

	base_antags = 1
	maximum_antags = 1
	denominator = 10 // Storytellerrrrrrrrrrrrrr

	var/list/allowed_court_roles = list(
		"Court Magician",
		"Consort",
		"Steward",
		"Hand",
		"Court Physician",
		"Councillor",
		"Archivist",
		"Dungeoneer",
		"Sergeant",
		"Men-at-arms",
		"Marshal",
		"Veteran",
	)

	proc/can_be_selected(mob/living/carbon/human/candidate)  //woman only im sorry you are not going to save the bloodline as a male
		if(candidate.gender != FEMALE)
			return FALSE
		if(!(candidate.job in allowed_court_roles))
			return FALSE
		return TRUE

	get_candidates()
		var/list/candidates = ..()
		var/list/filtered = list()
		for(var/mob/living/carbon/human/H in candidates)
			if(can_be_selected(H))
				filtered += H
		return filtered

	canSpawnEvent(players_amt, gamemode, fake_check)
		if(!prob(50))
			return FALSE
		return ..()
