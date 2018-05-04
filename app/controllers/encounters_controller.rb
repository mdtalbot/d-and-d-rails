class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def new
    @encounter = Encounter.new
    @monster = Monster.all
    @character = Character.all
  end

  def create
    @encounter = Encounter.new(encounters_params)
    if @encounter.valid?
      @encounter.save
      redirect_to encounter_path(@encounter)
    else
      flash[:errors] = @encounter.errors.full_messages
      redirect_to new_encounter_path
    end
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  def edit
    @encounter = Encounter.find(params[:id])
    @monster = Monster.all
    @character = Character.all
  end

  def update
    @encounter = Encounter.find(params[:id])
    @encounter.update(encounters_params)
    redirect_to encounter_path(@encounter)
  end

  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy
    flash[:notice] = "Encounter Deleted."
    redirect_to encounters_path
  end

  private

  def encounters_params
    params.require(:encounter).permit(:name, :content, :monster_id, :character_id)
  end

end
