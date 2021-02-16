class Api::PhotoOnesController < ApplicationController
  def index
    @photo_ones = PhotoOne.all
    render "index.json.jb"
  end

  def create
  end
end
