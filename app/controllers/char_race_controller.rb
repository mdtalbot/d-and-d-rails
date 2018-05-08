class CharRaceController < ApplicationController
  def index
    @char_races = CharRace.all
  end

  def show
    @char_race = CharRace.find(params[:id])
  end
end
