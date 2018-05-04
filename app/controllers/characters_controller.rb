class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
  end

  def create
    @character = Character.new(character_params)
    if @character.valid?
      @character.save
      redirect_to characters_path
    else
      flash[:errors] = @character.errors.full_messages
      redirect_to new_character_path
    end
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to characters_path
    else
      flash[:errors] = @character.errors.full_messages
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma)
  end
end
