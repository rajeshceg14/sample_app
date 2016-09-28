class PhotosController < ApplicationController
  before_filter :signed_in_user

#def update
#    photo = current_user.photos.find(params[:id])
#    photo.update_attributes(params[:photo])
#    photo.save!
#  end

  def create  	    
  	@photo = current_user.photos.new
    if params[:photo] == nil
      flash[:error] = "Select a photo"      
      redirect_to current_user
    end
    @photo.image = params[:photo][:image]
      	
  	if @photo.save
      flash[:success] = "Photo upload success!"      
      redirect_to current_user
    else
      puts " UPLOAD FAILED  #{@photo.errors.full_messages}"
      flash[:error] = "Photo upload failed"      
      redirect_to current_user
    end  	
  end

  def map_show
      
  end

  def destroy
  #debugger
  @photo = current_user.photos.find(params[:id])
  @photo.destroy
  redirect_to current_user
  end
end