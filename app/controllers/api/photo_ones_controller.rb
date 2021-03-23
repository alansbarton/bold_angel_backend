class Api::PhotoOnesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @photo_ones = PhotoOne.all
    render "index.json.jb"
  end

  def show
    @photo_one = PhotoOne.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    response = Cloudinary::Uploader.upload(params[:image])
    cloudinary_url = response["secure_url"]
    photo_one = PhotoOne.new(
      image: cloudinary_url,
      carousel: params[:carousel],
    )
    if photo_one.save
      render json: { message: "Image created succeddfully" }, status: :created
    else
      render json: { error: photo_one.error.full_message }, status: :bad_request
    end
  end

  def update
    @photo_one = PhotoOne.find_by(id: params[:id])
    @photo_one.carousel = params[:carousel] || @photo_one.carousel
    @photo_one.save
    render "show.json.jb"
  end

  def destroy
    @photo_one = PhotoOne.find_by(id: params[:id])
    @photo_one.destroy
    render json: { message: "image deleted" }
  end
end
