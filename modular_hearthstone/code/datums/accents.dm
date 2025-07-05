GLOBAL_LIST_INIT(character_accents, list("No accent",
	"Dwarf accent",
	"Dark Elf accent",
	"Snow Elf accent",
	"Grenzelhoft accent",
	"Hammerhold accent",
	"Assimar accent",
	"Lizard accent",
	"Lupian accent",
	"Tiefling accent",
	"Half Orc accent",
	"Urban Orc accent",
	"Hissy accent",
	"Inzectoid accent",
	"Feline accent",
	"Slopes accent",
	"Saut al-Atash accent",
	"Valley accent"))

// Global mapping of accent names to their font span lists
GLOBAL_LIST_INIT(accent_spans, list(
	"Saut al-Atash accent" = list(SPAN_SANDWAUK)
	//Add font-based accents here as needed
))

/mob/living/carbon/human
	var/char_accent = "No accent"
