require "rest-client"

###MONSTERS DATA###

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
#
# Character.create(name: "Greg the Old", strength: 14, dexterity: 12, consitution:12, intelligence: 11, wisdom: 16, charisma: 13)
# Character.create(name: "Lucinda Hogwild", strength: 11, dexterity: 13, consitution:12, intelligence: 16, wisdom: 14, charisma: 14)
#
# Monster.create(name: "Gerblin", description: "A short, green creature. Looks like Common and sounds like Kelsey Grammar.", hit_points: 10)
# Monster.create(name: "Eldritch ginuea pig", description: "An incombrehensible horror often eaten as a snack in Peru.", hit_points: 50)
