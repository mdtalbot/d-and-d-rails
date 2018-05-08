class CharClassController < ApplicationController
  def index
    @char_classes = CharClass.all
  end

  def show
    @char_class = CharClass.find(params[:id])
  end
end
