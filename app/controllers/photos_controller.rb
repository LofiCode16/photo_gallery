class PhotosController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_photo, only: %i[show]

  def index
    if user_signed_in?
      @photos = Photos.all
    else
      @photos = Photo.last_10_photos
    end
  end

  def show
  end

  def new
  
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end
end
