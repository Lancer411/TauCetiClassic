/proc/random_color()
	var/list/rand = list("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f")
	return "#" + pick(rand) + pick(rand) + pick(rand) + pick(rand) + pick(rand) + pick(rand)

//for chalkboard
/proc/count_occurrences(string, substring)
	var/count = 0
	var/found = 0
	var/length = length(substring)

	found = findtext(string, substring)

	while(found)
		count++
		found += length
		found = findtext(string, substring, found)

	return count

/proc/lowertext_tc(text)
	var/lenght = length(text)//length of the entire word
	var/p = 1
	var/new_text = null
	var/letter
	var/lcase_letter

	while(p <= lenght)//while P, which starts at 1 is less or equal to N which is the length.
		letter = copytext(text, p, p + 1)//copies text from a certain distance. In this case, only one letter at a time.
		lcase_letter = text2ascii(letter)

		if((lcase_letter >= 65 && lcase_letter <=90) || (lcase_letter >= 192 && lcase_letter <=223))
			lcase_letter = ascii2text(lcase_letter + 32)
			new_text += lcase_letter
		else
			new_text += letter


		p++

	return new_text

//from /tg, for cards
/mob/proc/get_item_by_slot(slot_id)
	switch(slot_id)
		if(slot_l_hand)
			return l_hand
		if(slot_r_hand)
			return r_hand
	return null