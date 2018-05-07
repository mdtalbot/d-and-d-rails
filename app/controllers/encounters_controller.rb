class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def new
    @encounter = Encounter.new
    @monsters = Monster.all
    @characters = Character.all
  end

  def create
    @encounter = Encounter.create(encounters_params)

    if @encounter.valid?
      redirect_to @encounter
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
    @monsters = Monster.all
    @characters = Character.all
  end

  def update
    find_encounter_by_id # Sets encounter to @encounter
    @encounter.update(encounters_params)
    
    redirect_to @encounter
  end

  def destroy
    find_encounter_by_id # Sets encounter to @encounter
    @encounter.destroy
    flash[:notice] = "Encounter Deleted."

    redirect_to encounters_path
  end

  private

  def encounters_params
    params.require(:encounter).permit(:name, :content, :monster_id, :character_id)
  end

  def find_encounter_by_id
    @encounter = Encounter.find(params[:id])
  end

end
