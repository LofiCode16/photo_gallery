class PhotosController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_photo, only: %i[show destroy]

  def index
    if user_signed_in?
      @photos = Photo.all
    else
      @photos = Photo.last_10_photos
    end
  end

  def show
    @comments = Comment.where(photo_id: @photo.id)
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    if @photo.save
      redirect_to root_path, notice: 'foto añadida!'
    else
      redirect_to new_photo_path, alert: 'no se pudo crear la foto'
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path, notice: 'foto eliminada'
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :image_url)
  end
end
