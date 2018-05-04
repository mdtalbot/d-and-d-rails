class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.valid?
      @monster.save
      redirect_to monster_path(@monster)
    else
      flash[:errors] = @monster.errors.full_messages
      redirect_to new_monster_path
    end

  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    @monster = Monster.find(params[:id])
    @monster.update(monster_params)
    redirect_to monster_path
  end

  def destroy
    @monster = Monster.find(params[:id])
    @monster.delete
    redirect_to monsters_path
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :description, :hit_points)
  end
end
