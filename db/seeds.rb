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
    monster_val["challenge_rating"] = 0.1 if monster_val["challenge_rating"] == 0.0

    mob = Monster.create(
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

    mob.stats.find_all do |key, value|
      if value == nil
        mob.update(key => 0)
      end
    end
    mob.save

  end

end

create_new_monster

#Sample User for testing
User.create(username: 'guest', email_address: "guest@guest.com", password: 'guest', password_confirmation: 'guest')

#Character class seeds
CharClass.create(name: "Barbarian", description: "A fierce warrior of primitive background who can enter a battle rage.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/342/420/618/636272680339895080.png")
CharClass.create(name: "Bard", description: "An inspiring magician whose music echoes the power of creation.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/369/420/618/636272705936709430.png")
CharClass.create(name: "Cleric", description: "A priestly champion who wields divine magic in service of a higher power.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/371/420/618/636272706155064423.png")
CharClass.create(name: "Druid", description: "A priest of the Old Faith who wields the powers of nature and adopts animal forms.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/346/420/618/636272691461725405.png")
CharClass.create(name: "Fighter", description: "A master of martial combat who is skilled with a variety of weapons and armor.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/359/420/618/636272697874197438.png")
CharClass.create(name: "Monk", description: "A master of martial arts who harnesses the power of the body in pursuit of physical and spiritual perfection.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/489/420/618/636274646181411106.png")
CharClass.create(name: "Paladin", description: "A holy warrior who is bound to their deity through a sacred oath.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/365/420/618/636272701937419552.png")
CharClass.create(name: "Ranger", description: "A warrior who combats threats on the edges of civilization and defends nature.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/367/420/618/636272702826438096.png")
CharClass.create(name: "Rogue", description: "A scoundrel who uses stealth and trickery to overcome obstacles and enemies.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/384/420/618/636272820319276620.png")
CharClass.create(name: "Sorcerer", description: "A spellcaster who possesses innate magic due to their bloodline or a magical gift.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/485/420/618/636274643818663058.png")
CharClass.create(name: "Warlock", description: "A wielder of eldritch magic whose powers are derived from a bargain with an extraplanar entity.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/375/420/618/636272708661726603.png")
CharClass.create(name: "Wizard", description: "A scholarly magic-user capable of manipulating the structures of reality.", image_url: "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/357/420/618/636272696881281556.png")

#Character race seeds
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

#Alignment seeds
Alignment.create(name: "Lawful Good", description: "Lawful good (LG) creatures can be counted on to do the right thing as expected by society. Gold dragons, paladins, and most dwarves are lawful good.")
Alignment.create(name: "Neutral Good", description: "Neutral good (NG) folk do the best they can to help others according to their needs. Many celestials, some cloud giants, and most gnomes are neutral good.")
Alignment.create(name: "Chaotic Good", description: "Chaotic good (CG) creatures act as their conscience directs, with little regard for what others expect. Copper dragons, many elves, and unicorns are chaotic good.")
Alignment.create(name: "Lawful Neutral", description: "Lawful neutral (LN) individuals act in accordance with law, tradition, or personal codes. Many monks and some wizards are lawful neutral.")
Alignment.create(name: "True Neutral", description: "Neutral (N) is the alignment of those who prefer to steer clear of moral questions and don't take sides, doing what seems best at the time. Lizardfolk, most druids, and many humans are neutral.")
Alignment.create(name: "Chaotic Neutral", description: "Chaotic neutral (CN) creatures follow their whims, holding their personal freedom above all else. Many barbarians and rogues, and some bards, are chaotic neutral.")
Alignment.create(name: "Lawful Evil", description: "Lawful evil (LE) creatures methodically take what they want, within the limits of a code of tradition, loyalty, or order. Devils, blue dragons, and hobgoblins are lawful evil.")
Alignment.create(name: "Neutral Evil", description: "Neutral evil (NE) is the alignment of those who do whatever they can get away with, without compassion or qualms. Many drow, some cloud giants, and goblins are neutral evil.")
Alignment.create(name: "Chaotic Evil", description: "Chaotic evil (CE) creatures act with arbitrary violence, spurred by their greed, hatred, or bloodlust. Demons, red dragons, and orcs are chaotic evil.")

#Sample character seeds
Character.create(name: "Greg the Old", strength: 14, dexterity: 12, constitution:12, intelligence: 11, wisdom: 16, charisma: 13, char_race_id: 12, char_class_id: 8, alignment_id: 5)
Character.create(name: "Lucinda Hogwild", strength: 11, dexterity: 13, constitution:12, intelligence: 16, wisdom: 14, charisma: 14, char_race_id: 7, char_class_id: 12, alignment_id: 3)

#Sample Encounter seeds
Encounter.create(name: "Everybody's Encounter", content: "It's for all of us!", monster_ids: ["1", "10", "11"], character_ids: ["1"])
Encounter.create(name: "Our Fight!", content: "It's for all of us!", monster_ids: ["4", "7", "30"], character_ids: ["1", "2"])
