require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views
  describe 'post create' do
    it 'redirects to the login page if :user_id is nil' do
      post :create
      expect(response).to redirect_to controller: 'sessions', action: 'new'
    end

  end

  describe 'post destroy' do
    it 'leaves session[:user_id] nil if it was not set' do
      post :destroy
      expect(@request.session[:user_id]).to be nil
    end
  end
end
