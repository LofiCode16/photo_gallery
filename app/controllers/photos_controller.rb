class PhotosController < ApplicationController
  before_action :authenticate_user!, except: :index

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
end
