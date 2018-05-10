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
