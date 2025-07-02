/datum/patron/old_god
	name = "Psydon"
	domain = "Celestial King of The Sacred Flame and Astral Majiyk"
	desc = "The Holy Martyr once cast into the River of Iron, thought dead by the astray believers of the Ten. His sacred embers live in all those who Remember him. A God cannot ever truly die, and Psydon is no exception. Those whose faith remains firm in the Martyr scoff at the Djinni lie of the Ten, and eagerly plot to send all the Apostates to the Great Silence!"
	worshippers = "Fanatics and Nostalgists, and those of the Holier Lands"
	associated_faith = /datum/faith/old_god
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/elucidate			= CLERIC_T1,
					/obj/effect/proc_holder/spell/targeted/churn/psychurn			= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/revive				= CLERIC_T3,
	)
	confess_lines = list(
		"THERE IS ONLY ONE TRUE GOD!",
		"PSYDON YET LIVES! PSYDON YET ENDURES!",
		"REBUKE THE HERETICAL- PSYDON ENDURES!",
		"PSYDON BE SAVED!"
	)
