class Monster < ApplicationRecord
  has_many :monster_encounters
  has_many :encounters, through: :monster_encounters
  belongs_to :user, optional: true

  validates :name, :description, :hit_points, presence: true
  validates :hit_points, inclusion: { in: 1..500, message: "value must be between 1 and 500."}

### MONSTER GENERATORS BY DIFFICULTY ###

def self.generate_random_monsters
  puts "Choose a monster difficulty: Very Easy, Easy, Medium, Hard, Very Hard, or Impossible."
    while answer = gets.chomp
      case answer.downcase
      when "very easy"
        Monster.generate_very_easy_monsters(number_of_monsters=3)
        break
      when "easy"
        Monster.generate_easy_monsters(number_of_monsters=3)
        break
      when "medium"
        Monster.generate_medium_monsters(number_of_monsters=3)
        break
      when "hard"
        Monster.generate_hard_monsters(number_of_monsters=3)
        break
      when "very hard"
        Monster.generate_very_hard_monsters(number_of_monsters=3)
        break
      when "impossible"
        Monster.generate_impossible_monsters(number_of_monsters=3)
        break
      else
      puts "Please enter a valid monster difficulty."
      end
    end
  end

  def self.generate_very_easy_monsters(number_of_monsters=0)
    if number_of_monsters == 0
      puts "Please enter how many monsters you would like."
    else
      very_easy_monsters = Monster.all.select do |monster_obj|
        monster_obj.challenge_rating < 1
      end
      very_easy_monsters.sample(number_of_monsters).map do |very_easy_monster_obj|
        puts ""
        puts "======================================================================"
        puts ""
        puts "Name: #{very_easy_monster_obj.name}"
        puts "Size: #{very_easy_monster_obj.size}"
        puts "Hit Points: #{very_easy_monster_obj.hit_points}"
        puts "Challenge Rating: #{very_easy_monster_obj.challenge_rating}"
        puts "Speed: #{very_easy_monster_obj.speed}, Armor Class: #{very_easy_monster_obj.armor_class}"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " STR: #{very_easy_monster_obj.strength}, DEX: #{very_easy_monster_obj.dexterity}, CON: #{very_easy_monster_obj.constitution}, INT: #{very_easy_monster_obj.intelligence}, WIS: #{very_easy_monster_obj.wisdom}, CHA: #{very_easy_monster_obj.charisma}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "ACTIONS"
        puts ""
          if very_easy_monster_obj.actions != "nil"
            one_line_cleaned_monster_objects = very_easy_monster_obj.actions.gsub(/[\[\]\\"]/, "")
            one_line_cleaned_monster_objects.split("},").map do |one_line_monster_actions|
            puts one_line_monster_actions
            puts ""
            end
          else
            puts "N/A"
          end
        puts "======================================================================"
        puts ""
      end
    end
  end

  def self.generate_easy_monsters(number_of_monsters=0)
    if number_of_monsters == 0
      puts "Please enter how many monsters you would like."
    else
      easy_monsters = Monster.all.select do |monster_obj|
        monster_obj.challenge_rating <= 3 && monster_obj.challenge_rating != 0
      end
      easy_monsters.sample(number_of_monsters).map do |easy_monster_obj|
        puts ""
        puts "======================================================================"
        puts ""
        puts "Name: #{easy_monster_obj.name}"
        puts "Size: #{easy_monster_obj.size}"
        puts "Hit Points: #{easy_monster_obj.hit_points}"
        puts "Challenge Rating: #{easy_monster_obj.challenge_rating}"
        puts "Speed: #{easy_monster_obj.speed}, Armor Class: #{easy_monster_obj.armor_class}"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " STR: #{easy_monster_obj.strength}, DEX: #{easy_monster_obj.dexterity}, CON: #{easy_monster_obj.constitution}, INT: #{easy_monster_obj.intelligence}, WIS: #{easy_monster_obj.wisdom}, CHA: #{easy_monster_obj.charisma}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "ACTIONS"
        puts ""
          if easy_monster_obj.actions != "nil"
            one_line_cleaned_monster_objects = easy_monster_obj.actions.gsub(/[\[\]\\"]/, "")
            one_line_cleaned_monster_objects.split("},").map do |one_line_monster_actions|
            puts one_line_monster_actions
            puts ""
            end
          else
            puts "N/A"
          end
        puts "======================================================================"
        puts ""
      end
    end
  end

  def self.generate_medium_monsters(number_of_monsters=0)
    if number_of_monsters == 0
      puts "Please enter how many monsters you would like."
    else
      medium_monsters = Monster.all.select do |monster_obj|
        monster_obj.challenge_rating > 3 && monster_obj.challenge_rating <= 7
      end
      medium_monsters.sample(number_of_monsters).map do |medium_monster_obj|
        puts ""
        puts "======================================================================"
        puts ""
        puts "Name: #{medium_monster_obj.name}"
        puts "Size: #{medium_monster_obj.size}"
        puts "Hit Points: #{medium_monster_obj.hit_points}"
        puts "Challenge Rating: #{medium_monster_obj.challenge_rating}"
        puts "Speed: #{medium_monster_obj.speed}, Armor Class: #{medium_monster_obj.armor_class}"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " STR: #{medium_monster_obj.strength}, DEX: #{medium_monster_obj.dexterity}, CON: #{medium_monster_obj.constitution}, INT: #{medium_monster_obj.intelligence}, WIS: #{medium_monster_obj.wisdom}, CHA: #{medium_monster_obj.charisma}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "ACTIONS"
        puts ""
          if medium_monster_obj.actions != "nil"
            one_line_cleaned_monster_objects = medium_monster_obj.actions.gsub(/[\[\]\\"]/, "")
            one_line_cleaned_monster_objects.split("},").map do |one_line_monster_actions|
            puts one_line_monster_actions
            puts ""
            end
          else
            puts "N/A"
          end
        puts "======================================================================"
        puts ""
      end
    end
  end

  def self.generate_hard_monsters(number_of_monsters=0)
    if number_of_monsters == 0
      puts "Please enter how many monsters you would like."
    else
      hard_monsters = Monster.all.select do |monster_obj|
        monster_obj.challenge_rating > 7 && monster_obj.challenge_rating <= 10
      end
      hard_monsters.sample(number_of_monsters).map do |hard_monster_obj|
        puts ""
        puts "======================================================================"
        puts ""
        puts "Name: #{hard_monster_obj.name}"
        puts "Size: #{hard_monster_obj.size}"
        puts "Hit Points: #{hard_monster_obj.hit_points}"
        puts "Challenge Rating: #{hard_monster_obj.challenge_rating}"
        puts "Speed: #{hard_monster_obj.speed}, Armor Class: #{hard_monster_obj.armor_class}"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " STR: #{hard_monster_obj.strength}, DEX: #{hard_monster_obj.dexterity}, CON: #{hard_monster_obj.constitution}, INT: #{hard_monster_obj.intelligence}, WIS: #{hard_monster_obj.wisdom}, CHA: #{hard_monster_obj.charisma}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "ACTIONS"
        puts ""
          if hard_monster_obj.actions != "nil"
            one_line_cleaned_monster_objects = hard_monster_obj.actions.gsub(/[\[\]\\"]/, "")
            one_line_cleaned_monster_objects.split("},").map do |one_line_monster_actions|
            puts one_line_monster_actions
            puts ""
            end
          else
            puts "N/A"
          end
        puts "======================================================================"
        puts ""
      end
    end
  end

  def self.generate_very_hard_monsters(number_of_monsters=0)
    if number_of_monsters == 0
      puts "Please enter how many monsters you would like."
    else
      very_hard_monsters = Monster.all.select do |monster_obj|
        monster_obj.challenge_rating > 10 && monster_obj.challenge_rating <= 20
      end
      very_hard_monsters.sample(number_of_monsters).map do |very_hard_monster_obj|
        puts ""
        puts "======================================================================"
        puts ""
        puts "Name: #{very_hard_monster_obj.name}"
        puts "Size: #{very_hard_monster_obj.size}"
        puts "Hit Points: #{very_hard_monster_obj.hit_points}"
        puts "Challenge Rating: #{very_hard_monster_obj.challenge_rating}"
        puts "Speed: #{very_hard_monster_obj.speed}, Armor Class: #{very_hard_monster_obj.armor_class}"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " STR: #{very_hard_monster_obj.strength}, DEX: #{very_hard_monster_obj.dexterity}, CON: #{very_hard_monster_obj.constitution}, INT: #{very_hard_monster_obj.intelligence}, WIS: #{very_hard_monster_obj.wisdom}, CHA: #{very_hard_monster_obj.charisma}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "ACTIONS"
        puts ""
          if very_hard_monster_obj.actions != "nil"
            one_line_cleaned_monster_objects = very_hard_monster_obj.actions.gsub(/[\[\]\\"]/, "")
            one_line_cleaned_monster_objects.split("},").map do |one_line_monster_actions|
            puts one_line_monster_actions
            puts ""
            end
          else
            puts "N/A"
          end
        puts "======================================================================"
        puts ""
      end
    end
  end

  def self.generate_impossible_monsters(number_of_monsters=0)
    if number_of_monsters == 0
      puts "Please enter how many monsters you would like."
    else
      impossible_monsters = Monster.all.select do |monster_obj|
        monster_obj.challenge_rating > 20 && monster_obj.challenge_rating <= 30
      end
      impossible_monsters.sample(number_of_monsters).map do |impossible_monster_object|
        puts ""
        puts "======================================================================"
        puts ""
        puts "Name: #{impossible_monster_object.name}"
        puts "Size: #{impossible_monster_object.size}"
        puts "Hit Points: #{impossible_monster_object.hit_points}"
        puts "Challenge Rating: #{impossible_monster_object.challenge_rating}"
        puts "Speed: #{impossible_monster_object.speed}, Armor Class: #{impossible_monster_object.armor_class}"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " STR: #{impossible_monster_object.strength}, DEX: #{impossible_monster_object.dexterity}, CON: #{impossible_monster_object.constitution}, INT: #{impossible_monster_object.intelligence}, WIS: #{impossible_monster_object.wisdom}, CHA: #{impossible_monster_object.charisma}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "ACTIONS"
        puts ""
          if impossible_monster_object.actions != "nil"
            one_line_cleaned_monster_objects = impossible_monster_object.actions.gsub(/[\[\]\\"]/, "")
            one_line_cleaned_monster_objects.split("},").map do |one_line_monster_actions|
            puts one_line_monster_actions
            puts ""
            end
          else
            puts "N/A"
          end
        puts "======================================================================"
        puts ""
      end
    end
  end

### END MONSTER GENERATORS BY DIFFICULTY ###


### SIZE ENCYCLOPEDIA ###

  def self.sizes
    puts "Choose a monster size: Tiny, Small, Medium, Large, Huge, or Gargantuan"
    while answer = gets.chomp
      case answer.downcase
      when "tiny"
        Monster.tiny
        break
      when "small"
        Monster.small
        break
      when "medium"
        Monster.medium
        break
      when "large"
        Monster.large
        break
      when "huge"
        Monster.huge
        break
      when "gargantuan"
        Monster.gargantuan
        break
      else
      puts "Please enter a valid monster size."
      end
    end
  end

### END SIZE ENCYCLOPEDIA ###


###HELPER METHODS###

  def self.tiny
    tiny_monster = Monster.all.select do |monster_object|
      monster_object.size == "Tiny"
    end
    tiny_monster.map do |monster_object|
      puts ""
      puts "#{monster_object.name}"
      puts "Challenge Rating: #{monster_object.challenge_rating}"
      puts "Hit Points: #{monster_object.hit_points}"
      puts ""
      puts "==========="
    end
  end

  def self.small
    small_monster = Monster.all.select do |monster_object|
      monster_object.size == "Small"
    end
    small_monster.map do |monster_object|
      puts ""
      puts "#{monster_object.name}"
      puts "Challenge Rating: #{monster_object.challenge_rating}"
      puts "Hit Points: #{monster_object.hit_points}"
      puts ""
      puts "==========="
    end
  end

  def self.medium
    medium_monster = Monster.all.select do |monster_object|
      monster_object.size == "Medium"
    end
    medium_monster.map do |monster_object|
      puts ""
      puts "#{monster_object.name}"
      puts "Challenge Rating: #{monster_object.challenge_rating}"
      puts "Hit Points: #{monster_object.hit_points}"
      puts ""
      puts "==========="
    end
  end

  def self.large
    large_monster = Monster.all.select do |monster_object|
      monster_object.size == "Large"
    end
    large_monster.map do |monster_object|
      puts ""
      puts "#{monster_object.name}"
      puts "Challenge Rating: #{monster_object.challenge_rating}"
      puts "Hit Points: #{monster_object.hit_points}"
      puts ""
      puts "==========="
    end
  end

  def self.huge
    huge_monster = Monster.all.select do |monster_object|
      monster_object.size == "Huge"
    end
    huge_monster.map do |monster_object|
      puts ""
      puts "#{monster_object.name}"
      puts "Challenge Rating: #{monster_object.challenge_rating}"
      puts "Hit Points: #{monster_object.hit_points}"
      puts ""
      puts "==========="
    end
  end

  def self.gargantuan
    gargantuan_monster = Monster.all.select do |monster_object|
      monster_object.size == "Gargantuan"
    end
    gargantuan_monster.map do |monster_object|
      puts ""
      puts "#{monster_object.name}"
      puts "Challenge Rating: #{monster_object.challenge_rating}"
      puts "Hit Points: #{monster_object.hit_points}"
      puts ""
      puts "==========="
    end
  end

  def self.random_monster
      Monster.all.sample
  end

  def cleaned_action_data
    Monster.all.map do |monster_object|
      almost_cleaned = monster_object.actions.gsub(/[\[\]\\"]/, "")
      cleaned = almost_cleaned[1..-2]
      cleaned
    end
  end

### END SIZE HELPER METHODS ###
end
