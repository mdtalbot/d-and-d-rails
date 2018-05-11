require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  it "Navigates to the proper home page, whether or not you are logged in." do
    get :home
    expect(response).to render_template(root_path)
  end

end
