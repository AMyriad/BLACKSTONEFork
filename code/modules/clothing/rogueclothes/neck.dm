/obj/item/clothing/neck/roguetown
	name = "translucent necklace"
	desc = "A worthless, imperceptible trinket. You feel as if you should report seeing this."
	icon = 'icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/neck.dmi'
	bloody_icon_state = "bodyblood"


	/// COIFS ///

/obj/item/clothing/neck/roguetown/coif
	name = "coif"
	desc = "A simple cloth garment made to protect the head or neck from the elements."
	icon_state = "coif"
	item_state = "coif"

	flags_inv = HIDEEARS | HIDEHAIR
	slot_flags = ITEM_SLOT_NECK | ITEM_SLOT_HEAD
	body_parts_covered = NECK |HAIR | EARS | HEAD
	blocksound = SOFTHIT
	armor = list("melee" = 12, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE

/obj/item/clothing/neck/roguetown/coif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()

/obj/item/clothing/neck/roguetown/coif/chain
	name = "chain coif"
	desc = "A mesh of steel chain, lightweight but durable."
	icon_state = "chaincoif"
	item_state = "chaincoif"

	blocksound = CHAINHIT
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200
	resistance_flags = FIRE_PROOF
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/neck/roguetown/coif/chain/iron
	name = "iron chain coif"
	desc = "A light mesh of iron chain, leightweight but durable."
	icon_state = "ichaincoif"

	smeltresult = /obj/item/ingot/iron

	
	/// ARMORS ///

/obj/item/clothing/neck/roguetown/bevor
	name = "bevor"
	desc = "A sturdy piece of armor meant to shield the wearer's throat from harm."
	icon_state = "bevor"

	flags_inv = HIDEFACIALHAIR
	armor = list("melee" = 100, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/steel
	max_integrity = 300
	resistance_flags = FIRE_PROOF
	body_parts_covered = NECK | EARS | MOUTH | NOSE
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/gorget
	name = "gorget"
	desc = "A "
	icon_state = "gorget"

	flags_inv = HIDEFACIALHAIR
	armor = list("melee" = 100, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	max_integrity = 150
	resistance_flags = FIRE_PROOF
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT


	/// PSYCROSSES ///

/obj/item/clothing/neck/roguetown/psicross
	name = "psycross"
	desc = "A ward against evil."
	icon_state = "psicross"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

/obj/item/clothing/neck/roguetown/psicross/astrata
	name = "amulet of Astrata"
	desc = ""
	icon_state = "astrata"

/obj/item/clothing/neck/roguetown/psicross/noc
	name = "amulet of Noc"
	desc = ""
	icon_state = "noc"

/obj/item/clothing/neck/roguetown/psicross/dendor
	name = "amulet of Dendor"
	desc = ""
	icon_state = "dendor"

/obj/item/clothing/neck/roguetown/psicross/necra
	name = "amulet of Necra"
	desc = ""
	icon_state = "necra"

/obj/item/clothing/neck/roguetown/psicross/silver
	name = "silver psycross"
	icon_state = "psicrossiron"
	sellprice = 50

/obj/item/clothing/neck/roguetown/psicross/silver/funny_attack_effects(mob/living/target, mob/living/user, nodmg)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				target.Knockdown(30)
				target.Stun(30)
	if(target.mind && target.mind.has_antag_datum(/datum/antagonist/vampirelord))
		var/datum/antagonist/vampirelord/VD = target.mind.has_antag_datum(/datum/antagonist/vampirelord)
		if(!VD.disguised)
			target.Knockdown(30)
			target.Stun(30)

/obj/item/clothing/neck/roguetown/psicross/silver/mob_can_equip(mob/living/M)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				to_chat(user, "<span class='userdanger'>SILVER! GET IT OFF!!</span>")
				return FALSE
	if(M.mind && M.mind.has_antag_datum(/datum/antagonist/vampirelord))
		to_chat(user, "<span class='userdanger'>SILVER! HISSS!!!</span>")
		return FALSE

/obj/item/clothing/neck/roguetown/psicross/g
	name = "golden psycross"
	desc = ""
	icon_state = "psicrossg"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100


	/// AMULETS ///

/obj/item/clothing/neck/roguetown/talkstone
	name = "talkstone"
	desc = ""
	icon_state = "talkstone"
	item_state = "talkstone"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 98

/obj/item/clothing/neck/roguetown/horus
	name = "eye of horuz"
	desc = ""
	icon_state = "horus"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 30

/obj/item/clothing/neck/roguetown/shalal
	name = "desert rider medal"
	desc = ""
	icon_state = "shalal"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 15
