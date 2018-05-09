class UsersController < ApplicationController

  def encounters_index
    set_user_by_current_user
    if logged_in?
      @encounters = @user.encounters
    else
      flash[:notice] = "You are not logged in."
      redirect_to encounters_path
    end
  end

  def encounter_show
    set_user_by_current_user
    @encounter = Encounter.find(params[:encounter_id])
  end

  # def encounter_edit
  #   @encounter = Encounter.find(params[:encounter_id])
  #   @characters = Character.all
  #   monsters_by_cr
  # end

  def characters_index
    set_user_by_current_user
    if logged_in?
      @characters = @user.characters
    else
      flash[:notice] = "You are not logged in."
      redirect_to characters_path
    end
  end

  def character_show
    set_user_by_current_user
    @character = Character.find(params[:character_id])
  end

  # def character_edit
  #   @character = Character.find(params[:character_id])
  #   @char_races = CharRace.all
  #   @char_classes = CharClass.all
  #   @alignments = Alignment.all
  # end

  def monsters_index
    set_user_by_current_user
    if logged_in?
      @monsters = @user.monsters
    else
      flash[:notice] = "You are not logged in."
      redirect_to monsters_path
    end
  end

  def monster_show
    set_user_by_current_user
    @monster = Monster.find(params[:monster_id])
  end

  def show
    find_user_by_id
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      WelcomeMailer.new_user.deliver_now
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to register_path
    end
  end

  def edit
    find_user_by_id
    if !authorized_for_user(@user)
      redirect_to current_user
    else
      @encounters = Encounter.where(user_id: nil).or(Encounter.where(user_id: @user.id))
    end
  end

  def update
    find_user_by_id
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    find_user_by_id.delete
    session[:user_id] = nil
    flash[:notice] = "Your account has been deleted."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation, encounter_ids: [], character_ids: [])
  end

  def find_user_by_id
    @user = User.find(params[:id])
  end

  def set_user_by_current_user
    @user = current_user
  end
end
