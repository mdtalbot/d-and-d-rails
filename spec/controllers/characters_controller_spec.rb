require 'rails_helper'

RSpec.describe CharactersController, type: :controller do

  it "renders the characters index page" do
    get :index
    expect(response).to render_template("characters/index")
  end

  it "renders the characters new page" do
    get :new
    expect(response).to render_template("characters/new")
  end

end
