class Api::PhotoOnesController < ApplicationController
  def index
    @photo_ones = PhotoOne.all
    render "index.json.jb"
  end

  def create
    photo_one = PhotoOne.new(
      image: params[:image],
    )
    if photo_one.save
      render json: { message: "Image created succeddfully" }, status: :created
    else
      render json: { error: photo_one.error.full_message }, status: :bad_request
    end
  end
end
