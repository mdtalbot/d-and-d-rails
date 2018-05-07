class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.create(monster_params)
    if @monster.valid?
      redirect_to @monster
    else
      flash[:errors] = @monster.errors.full_messages
      redirect_to new_monster_path
    end

  end

  def show
    find_monster_by_id # Assigns monster to @monster
  end

  def edit
    find_monster_by_id # Assigns monster to @monster
  end

  def update
    find_monster_by_id # Assigns monster to @monster
    @monster.update(monster_params)

    redirect_to monster_path
  end

  def destroy
    find_monster_by_id # Assigns monster to @monster
    @monster.delete
    flash[:notice] = "Monster Deleted."

    redirect_to monsters_path
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :description, :hit_points)
  end

  def find_monster_by_id
    @monster = Monster.find(params[:id])
  end

end
