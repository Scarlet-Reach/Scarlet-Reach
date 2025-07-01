#define pick_list(FILE, KEY) (pick(strings(FILE, KEY)))
#define pick_list_replacements(FILE, KEY) (strings_replacement(FILE, KEY))
#define json_load(FILE) (json_decode(file2text(FILE)))

GLOBAL_LIST(string_cache)
GLOBAL_VAR(string_filename_current_key)


/proc/strings_replacement(filename, key, directory = "strings")
	load_strings_file(filename, directory)

	if((filename in GLOB.string_cache) && (key in GLOB.string_cache[filename]))
		var/response = pick(GLOB.string_cache[filename][key])
		var/regex/r = regex("@pick\\((\\D+?)\\)", "g")
		response = r.Replace(response, GLOBAL_PROC_REF(strings_subkey_lookup))
		return response
	else
		CRASH("strings list not found: [directory]/[filename], index=[key]")

/proc/strings(filename as text, key as text, directory = "strings", convert_HTML = FALSE)
	load_strings_file(filename, directory, convert_HTML)
	if((filename in GLOB.string_cache) && (key in GLOB.string_cache[filename]))
		return GLOB.string_cache[filename][key]
	else
		CRASH("strings list not found: [directory]/[filename], index=[key]")

/proc/strings_subkey_lookup(match, group1)
	return pick_list(GLOB.string_filename_current_key, group1)

/proc/special_chars_to_html_tags(list/strings)
	for (var/key in strings)
		strings[replacetext(key, "\'", "&#39;")] = strings[key]
	return strings

/proc/load_strings_file(filename, directory = "strings", convert_HTML)
	GLOB.string_filename_current_key = filename
	if(filename in GLOB.string_cache)
		return //no work to do

	if(!GLOB.string_cache)
		GLOB.string_cache = new

	if(fexists("[directory]/[filename]"))
		GLOB.string_cache[filename] = json_load("[directory]/[filename]")
	else
		if (convert_HTML)
			if ("full" in GLOB.string_cache[filename])
				GLOB.string_cache[filename]["full"] = special_chars_to_html_tags(GLOB.string_cache[filename]["full"])
