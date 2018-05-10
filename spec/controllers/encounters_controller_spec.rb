require 'rails_helper'

RSpec.describe EncountersController, type: :controller do

  it "renders the encounters index page" do
    get :index
    expect(response).to render_template("encounters/index")
  end

  it "renders the encounters new page" do
    get :new
    expect(response).to render_template("encounters/new")
  end


end
