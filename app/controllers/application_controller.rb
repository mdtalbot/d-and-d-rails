class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :permitted?
  helper_method :current_user

  def home
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def permitted?(user)
    if logged_in?
      user == current_user
    end
  end

  def authorized_for_user(user)
    authorized
    if current_user != user
      redirect_to current_user
    end
  end

  def analytics
    analytics_numbers
    all_classes_for_analytics
  end

  private

  def very_easy_monsters
    @very_easy_monsters = Monster.where(challenge_rating: 0)
  end

  def easy_monsters
    @easy_monsters = Monster.where(challenge_rating: [1, 2, 3])
  end

  def medium_monsters
    @medium_monsters = Monster.where(challenge_rating: [4, 5, 6, 7])
  end

  def hard_monsters
    @hard_monsters = Monster.where(challenge_rating: [8, 9, 10])
  end

  def very_hard_monsters
    @very_hard_monsters = Monster.where(challenge_rating: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
  end

  def impossible_monsters
    @impossible_monsters = Monster.where(challenge_rating: [21, 22, 23, 24, 25, 26, 27, 28, 29, 30])
  end

  def analytics_numbers
    @monster_numbers =
      if Monster.all.count != 0
        Monster.all.count
      else
        0
      end
    @character_numbers =
      if Character.all.count != 0
        Character.all.count
      else
        0
      end
    @encounter_numbers = Encounter.all.count
    @pets_numbers = Pet.all.count
    @users_numbers = User.all.count
  end

  def all_classes_for_analytics
    @monster = Monster.all
    @character = Character.all
    @encounter = Encounter.all
    @pets = Pet.all
    @users = User.all
  end
end
