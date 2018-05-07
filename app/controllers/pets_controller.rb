class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def search
    find_pet_by_name
    if @pets.length > 0
      render :index
    else
      flash[:errors] = "That pet does not exist."
      redirect_to pets_path
    end
  end

  def new
    @pet = Pet.new
    @characters = Character.all
  end

  def create
    @pet = Pet.create(pet_params)
    if @pet.valid?
      redirect_to pet_path(@pet)
    else
      flash[:errors] = @pet.errors.full_messages
      redirect_to new_pet_path
    end
  end

  def show
    find_pet_by_id # Assigns pet to @pet
  end

  def edit
  end

  def update
    find_pet_by_id # Assigns pet to @pet
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      flash[:errors] = @pet.errors.full_messages
      redirect_to pet_path(@pet)
    end
  end

  def destroy
    find_pet_by_id # Assigns pet to @pet
    @pet.destroy
    flash[:notice] = "Pet Deleted."

    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :character_id)
  end

  def find_pet_by_id
    @pet = Pet.find(params[:id])
  end

  def find_pet_by_name
    @pets = Pet.where(Pet.arel_table[:name].lower.matches(params[:search_term].downcase))
  end
end
