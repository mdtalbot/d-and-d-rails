class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def search
    find_character_by_name
    if @characters.length > 0
      render :index
    else
      flash[:errors] = "That character does not exist."
      redirect_to characters_path
    end
  end

  def new
    @character = Character.new
    @char_races = CharRace.all
    @char_classes = CharClass.all
    @alignments = Alignment.all
  end

  def show
    find_character_by_id #Assigns character to @character
    @char_races = CharRace.all
    @char_classes = CharClass.all
    @alignments = Alignment.all
  end

  def edit
    find_character_by_id #Assigns character to @character
    @char_races = CharRace.all
    @char_classes = CharClass.all
    @alignments = Alignment.all

    if !permitted?(@character.user)
      flash[:notice] = "You are not authorized to edit this item."
      redirect_to @character
    end
  end

  def create
    @character = Character.create(character_params)

    if @character.valid? && logged_in?
      @character.update(user_id: current_user.id)
      redirect_to my_character_path(current_user.id, @character)
    elsif @character.valid?
      redirect_to character_path(@character)
    else
      flash[:errors] = @character.errors.full_messages
      redirect_to new_character_path
    end

  end

  def update
    find_character_by_id #Assigns character to @character

    if @character.update(character_params)
      redirect_to @character
    else
      flash[:errors] = @character.errors.full_messages
      redirect_to edit_character_path
    end
  end

  def destroy
    find_character_by_id #Assigns character to @character
    if permitted?(@character.user)
      @character.destroy
      flash[:notice] = "Character Deleted."
      redirect_to my_characters_path
    else
      flash[:notice] = "You are not authorized to delete that item."
      redirect_to characters_path
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :char_class_id, :char_race_id, :alignment_id, :level, :experience, :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma)
  end

  def find_character_by_id
    @character = Character.find(params[:id])
  end

  def find_character_by_name
    @characters = Character.where(Character.arel_table[:name].lower.matches(params[:search_term].downcase))
  end
end
