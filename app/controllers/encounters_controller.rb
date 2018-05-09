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
    @characters = Character.all
    monsters_by_cr
  end

  def create
    @encounter = Encounter.create(encounters_params)
    #TESTING NEXT LINE
    challenge_sum(encounters_params)
    player_level_sum(encounters_params)

    if @encounter.valid? && logged_in?
      @encounter.update(user_id: current_user.id)
      redirect_to my_encounter_path(current_user.id, @encounter)
    elsif @encounter.valid?
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

  def update
    find_encounter_by_id # Sets encounter to @encounter

    if @encounter.update(encounters_params)
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

  def challenge_sum(encounters_params)
    sum = 0
    monster_objs = Monster.where(id: encounters_params[:monster_ids])
    monster_objs.each do |monster|
       sum += monster.challenge_rating
    end
    average_monster_level = (sum.to_f / monster_objs.count)
    average_monster_level
  end

  def player_level_sum(encounters_params)
    sum = 0
    char_objs = Character.where(id: encounters_params[:character_ids])
    char_objs.each do |char|
      sum += char.level
    end
    average_player_level = (sum.to_f / char_objs.count)
    average_player_level
  end

  def generate_encounter_monsters(encounters_params)
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
