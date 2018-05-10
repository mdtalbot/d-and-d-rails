require 'rails_helper'

RSpec.describe MonstersController, type: :controller do

  it "renders the monsters index page" do
    get :index
    expect(response).to render_template("monsters/index")
  end

  it "renders the monsters new page" do
    get :new
    expect(response).to render_template("monsters/new")
  end
end
