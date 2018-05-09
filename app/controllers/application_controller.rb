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

end
