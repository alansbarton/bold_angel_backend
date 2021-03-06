class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :create]

  def index
    @users = User.all
    render "index.json.jb"
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    user = User.new(
      user_name: params[:user_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    response = Cloudinary::Uploader.upload(params[:profile_pic])
    cloudinary_url = response["secure_url"]
    @user = User.find_by(id: params[:id])
    @user.email = params[:email] || @user.email
    @user.about_me = params[:about_me] || @user.about_me
    @user.profile_pic = cloudinary_url || cloudinary_url
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.save
    render "show.json.jb"
  end
end
