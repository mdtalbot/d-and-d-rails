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
    @monsters = Monster.all
    @characters = Character.all
  end

  def create
    @encounter = Encounter.create(encounters_params)

    if @encounter.valid?
      if logged_in?
        @encounter.update(user_id: current_user.id)
      end
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
    params.require(:encounter).permit(:name, :content, monster_ids: [], character_ids: [])
  end

  def find_encounter_by_id
    @encounter = Encounter.find(params[:id])
  end

  def find_encounter_by_name
    @encounters = Encounter.where(Encounter.arel_table[:name].lower.matches(params[:search_term].downcase))
  end

end
