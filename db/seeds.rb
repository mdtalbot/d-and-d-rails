Character.create(name: "Greg the Old", strength: 14, dexterity: 12, consitution:12, intelligence: 11, wisdom: 16, charisma: 13, char_race_id: 12, char_class_id: 8, alignment_id: 5)
Character.create(name: "Lucinda Hogwild", strength: 11, dexterity: 13, consitution:12, intelligence: 16, wisdom: 14, charisma: 14, char_race_id: 7, char_class_id: 12, alignment_id: 3)

Monster.create(name: "Gerblin", description: "A short, green creature. Looks like Common and sounds like Kelsey Grammar.", hit_points: 10)
Monster.create(name: "Eldritch ginuea pig", description: "An incombrehensible horror often eaten as a snack in Peru.", hit_points: 50)

CharClass.create(name: "Barbarian", description: "A fierce warrior of primitive background who can enter a battle rage.")
CharClass.create(name: "Bard", description: "An inspiring magician whose music echoes the power of creation.")
CharClass.create(name: "Cleric", description: "A priestly champion who wields divine magic in service of a higher power.")
CharClass.create(name: "Druid", description: "A priest of the Old Faith who wields the powers of nature and adopts animal forms.")
CharClass.create(name: "Fighter", description: "A master of martial combat who is skilled with a variety of weapons and armor.")
CharClass.create(name: "Monk", description: "A master of martial arts who harnesses the power of the body in pursuit of physical and spiritual perfection.")
CharClass.create(name: "Paladin", description: "A holy warrior who is bound to their deity through a sacred oath.")
CharClass.create(name: "Ranger", description: "A warrior who combats threats on the edges of civilization and defends nature.")
CharClass.create(name: "Rogue", description: "A scoundrel who uses stealth and trickery to overcome obstacles and enemies.")
CharClass.create(name: "Sorcerer", description: "A spellcaster who possesses innate magic due to their bloodline or a magical gift.")
CharClass.create(name: "Warlock", description: "A wielder of eldritch magic whose powers are derived from a bargain with an extraplanar entity.")
CharClass.create(name: "Wizard", description: "A scholarly magic-user capable of manipulating the structures of reality.")

CharRace.create(name: "Aarakocra", description: "Sequestered in high mountains atop tall trees, the aarakocra, sometimes called birdfolk, evoke fear and wonder.")
CharRace.create(name: "Aasimar", description: "Aasimar are placed in the world to serve as guardians of law and good. Their patrons expect them to strike at evil, lead by example, and further the cause of justice.")
CharRace.create(name: "Dragonborn", description: "Dragonborn look very much like dragons standing erect in humanoid form, though they lack wings or a tail.")
CharRace.create(name: "Dwarf", description: "Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal.")
CharRace.create(name: "Elf", description: "Elves are a magical people of otherworldly grace, living in the world but not entirely part of it.")
CharRace.create(name: "Genasi", description: "Genasi carry the power of the elemental planes of air, earth, fire, and water in their blood.")
CharRace.create(name: "Gnome", description: "A gnome’s energy and enthusiasm for living shines through every inch of his or her tiny body.")
CharRace.create(name: "Goliath", description: "Strong and reclusive, every day brings a new challenge to a goliath.")
CharRace.create(name: "Half-Elf", description: "Half-elves combine what some say are the best qualities of their elf and human parents.")
CharRace.create(name: "Halfling", description: "The diminutive halflings survive in a world full of larger creatures by avoiding notice or, barring that, avoiding offense.")
CharRace.create(name: "Half-Orc", description: "Half-orcs’ grayish pigmentation, sloping foreheads, jutting jaws, prominent teeth, and towering builds make their orcish heritage plain for all to see.")
CharRace.create(name: "Human", description: "Humans are the most adaptable and ambitious people among the common races. Whatever drives them, humans are the innovators, the achievers, and the pioneers of the worlds.")
CharRace.create(name: "Tiefling", description: "To be greeted with stares and whispers, to suffer violence and insult on the street, to see mistrust and fear in every eye: this is the lot of the tiefling.")

Alignment.create(name: "Lawful Good", description: "Lawful good (LG) creatures can be counted on to do the right thing as expected by society. Gold dragons, paladins, and most dwarves are lawful good.")
Alignment.create(name: "Neutral Good", description: "Neutral good (NG) folk do the best they can to help others according to their needs. Many celestials, some cloud giants, and most gnomes are neutral good.")
Alignment.create(name: "Chaotic Good", description: "Chaotic good (CG) creatures act as their conscience directs, with little regard for what others expect. Copper dragons, many elves, and unicorns are chaotic good.")
Alignment.create(name: "Lawful Neutral", description: "Lawful neutral (LN) individuals act in accordance with law, tradition, or personal codes. Many monks and some wizards are lawful neutral.")
Alignment.create(name: "True Neutral", description: "Neutral (N) is the alignment of those who prefer to steer clear of moral questions and don't take sides, doing what seems best at the time. Lizardfolk, most druids, and many humans are neutral.")
Alignment.create(name: "Chaotic Neutral", description: "Chaotic neutral (CN) creatures follow their whims, holding their personal freedom above all else. Many barbarians and rogues, and some bards, are chaotic neutral.")
Alignment.create(name: "Lawful Evil", description: "Lawful evil (LE) creatures methodically take what they want, within the limits of a code of tradition, loyalty, or order. Devils, blue dragons, and hobgoblins are lawful evil.")
Alignment.create(name: "Neutral Evil", description: "Neutral evil (NE) is the alignment of those who do whatever they can get away with, without compassion or qualms. Many drow, some cloud giants, and goblins are neutral evil.")
Alignment.create(name: "Chaotic Evil", description: "Chaotic evil (CE) creatures act with arbitrary violence, spurred by their greed, hatred, or bloodlust. Demons, red dragons, and orcs are chaotic evil.")

def monster_parsing
all_monster_data = RestClient.get("http://www.dnd5eapi.co/api/monsters")
parsed_monster_data = JSON.parse(all_monster_data)
parsed_monster_data
end

def monsters_object
  monster_parsing["results"]
end

def monster_info
  monster_info_hash={}
  monster_info_hashes = monsters_object.map do |monster_obj|
    monsters_data = RestClient.get(monster_obj["url"])
    cleaned_monster_data = JSON.parse(monsters_data)
    monster_info_hash[cleaned_monster_data["name"]] = cleaned_monster_data
  end
  monster_info_hash
end

def create_new_monster
  monster_info.each do |monster_key, monster_val|

    Monster.create(
    name: monster_key,
    hit_points: monster_val["hit_points"],
    size: monster_val["size"],
    description: monster_val["type"],
    challenge_rating: monster_val["challenge_rating"],
    armor_class: monster_val["armor_class"],
    strength: monster_val["strength"],
    dexterity: monster_val["dexterity"],
    constitution: monster_val["constitution"],
    intelligence: monster_val["intelligence"],
    wisdom: monster_val["wisdom"],
    charisma: monster_val["charisma"],
    constitution_save: monster_val["constitution_save"],
    intelligence_save: monster_val["intelligence_save"],
    wisdom_save: monster_val["wisdom_save"],
    history: monster_val["history"],
    perception: monster_val["perception"],
    )

  end

end

create_new_monster
