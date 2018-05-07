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
  end

  def show
    find_character_by_id #Assigns character to @character
  end

  def edit
    find_character_by_id #Assigns character to @character
  end

  def create
    @character = Character.create(character_params)

    if @character.valid?
      redirect_to characters_path
    else
      flash[:errors] = @character.errors.full_messages
      redirect_to new_character_path
    end

  end

  def update
    find_character_by_id #Assigns character to @character

    if @character.update(character_params)
      redirect_to characters_path
    else
      flash[:errors] = @character.errors.full_messages
      redirect_to edit_character_path
    end
  end

  def destroy
    find_character_by_id #Assigns character to @character
    @character.destroy
    flash[:notice] = "Character Deleted."

    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma)
  end

  def find_character_by_id
    @character = Character.find(params[:id])
  end

  def find_character_by_name
    @characters = Character.where(Character.arel_table[:name].lower.matches(params[:search_term].downcase))
  end
end
