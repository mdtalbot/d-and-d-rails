class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
    @characters = Character.all
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.valid?
      @pet.save
      redirect_to pet_path(@pet)
    else
      flash[:errors] = @pet.errors.full_messages
      redirect_to new_pet_path
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      flash[:errors] = @pet.errors.full_messages
      redirect_to pet_path(@pet)
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :character_id)
  end
end
