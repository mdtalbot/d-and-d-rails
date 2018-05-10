class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def search
    find_encounter_by_name
    if @encounters.length > 0
      render :index
    else
      flash[:errors] = "That encounter does not exist."
      redirect_to encounters_path
    end
  end

  def new
    @encounter = Encounter.new
    @characters = Character.all
    monsters_by_cr
  end

  def preview
    @encounter = Encounter.new(encounters_params)
  end

  def create
    @encounter = Encounter.create(encounters_params)

    if @encounter.valid? && logged_in?
      set_monster_quantities(@encounter)
      @encounter.update(user_id: current_user.id)

      calculate_difficulty(@encounter)

      redirect_to my_encounter_path(current_user.id, @encounter)
    elsif @encounter.valid?
      set_monster_quantities(@encounter)

      calculate_difficulty(@encounter)

      redirect_to encounter_path(@encounter)
    else
      flash[:errors] = @encounter.errors.full_messages
      redirect_to new_encounter_path
    end
  end

  def show
    find_encounter_by_id # Sets encounter to @encounter
  end

  def edit
    find_encounter_by_id # Sets encounter to @encounter
    @characters = Character.all
    monsters_by_cr

    if !permitted?(@encounter.user)
      flash[:notice] = "You are not authorized to edit this item."
      redirect_to @encounter
    end
  end

  def edit_preview
    @encounter = Encounter.find(params[:id])
    @encounter.monster_ids = params[:encounter][:monster_ids]
    @encounter.save
  end

  def update
    find_encounter_by_id # Sets encounter to @encounter

    if @encounter.update(encounters_params)
      set_monster_quantities(@encounter)
      redirect_to @encounter
    else
      flash[:errors] = @encounter.errors.full_messages
      redirect_to edit_encounter_path
    end
  end

  def destroy
    find_encounter_by_id # Sets encounter to @encounter
    if permitted?(@encounter.user)
      @encounter.destroy
      flash[:notice] = "Encounter Deleted."
      redirect_to my_encounters_path
    else
      flash[:notice] = "You are not authorized to delete that item."
      redirect_to encounters_path
    end
  end

  private

  def encounters_params
    params.require(:encounter).permit(:name, :content, monster_ids: [], character_ids: [])
  end

  def find_encounter_by_id
    @encounter = Encounter.find(params[:id])
  end

  def find_encounter_by_name
    @encounters = Encounter.where(Encounter.arel_table[:name].lower.matches(params[:search_term].downcase))
  end

  def set_monster_quantities(encounter)
    encounter.monster_encounters.each do |m_e|
      m_e.quantity = params[:encounter][:quantity]["#{m_e.monster.id}"]
      m_e.save
    end
  end

  def calculate_difficulty(encounter)
    monster_challenge_sum(encounter)
    player_level_avg(encounter)
    determine_challenge_rating(encounter)
  end

  def monster_challenge_sum(encounter)
    sum = 0
    monster_objs = Monster.where(id: encounter.monster_ids)

    monster_objs.each do |monster|
      sum += ( monster.challenge_rating * monster.quantity_by_encounter(encounter) )
    end

    sum
  end

  def player_level_avg(encounter)
    sum = 0
    char_objs = Character.where(id: encounter.character_ids)

    char_objs.each do |char|
      sum += char.level
    end

    average_player_level = (sum.to_f / char_objs.count)
    average_player_level
  end

  def determine_challenge_rating(encounter)
    difference = ( monster_challenge_sum(encounter).to_f - player_level_avg(encounter).to_f )

    case difference
    when 3...4
      encounter.difficulty = "Difficulty: Brutal"
    when 2...3
      encounter.difficulty = "Difficulty: Hard"
    when 1...2
      encounter.difficulty = "Difficulty: Challenging"
    when -1...-2
      encounter.difficulty = "Difficulty: Fairly Easy"
    when -2...-3
      encounter.difficulty = "Difficulty: Easy"
    when -3...-4
      encounter.difficulty = "Difficulty: Very Easy"
    else
      if difference >= 4
        encounter.difficulty = "Difficulty: Lethal"
      elsif difference <= -4
        encounter.difficulty = "Difficulty: Pushover"
      else
        flash[:notice] = "difference = #{difference}"
        encounter.difficulty = "Difficulty: Evenly Matched"
      end
    end
    encounter.save
  end

  def monsters_by_cr
    very_easy_monsters
    easy_monsters
    medium_monsters
    hard_monsters
    very_hard_monsters
    impossible_monsters
  end

  def very_easy_monsters
    @very_easy_monsters = Monster.where(challenge_rating: 0)
  end

  def easy_monsters
    @easy_monsters = Monster.where(challenge_rating: [1, 2, 3])
  end

  def medium_monsters
    @medium_monsters = Monster.where(challenge_rating: [4, 5, 6, 7])
  end

  def hard_monsters
    @hard_monsters = Monster.where(challenge_rating: [8, 9, 10])
  end

  def very_hard_monsters
    @very_hard_monsters = Monster.where(challenge_rating: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
  end

  def impossible_monsters
    @impossible_monsters = Monster.where(challenge_rating: [21, 22, 23, 24, 25, 26, 27, 28, 29, 30])
  end

end
