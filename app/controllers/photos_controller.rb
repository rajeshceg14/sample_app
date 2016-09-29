class PhotosController < ApplicationController
  before_filter :signed_in_user

#def update
#    photo = current_user.photos.find(params[:id])
#    photo.update_attributes(params[:photo])
#    photo.save!
#  end

  def create  	        
  	@photo = current_user.photos.new  
    puts "PARAMS PHOTO = #{params[:photo]}"
    if params[:photo].blank?
       flash[:notice] = "Select a photo"      
       redirect_to current_user
    else
    	if @photo.save
        flash[:notice] = "Photo upload success!"      
        redirect_to current_user
      else        
        puts " UPLOAD FAILED  #{@photo.errors.full_messages}  img content type = #{@photo.errors[:image_content_type]}"
        debugger
        if @photo.errors[:image_content_type] != nil        
          flash[:notice] = "Plz Upload an image"
        else
          flash[:notice] = "Photo upload failed"          
        end
        redirect_to current_user
      end  	
    end
  end

  def map_show      
      @photo = current_user.photos.find(params[:id])
      @exif =EXIFR::JPEG.new(Rails.root.to_s + "/public" +@photo.image.url(:original,timestamp: false)).gps        
      @lat= @exif.latitude
      @long=@exif.longitude
      puts "#{@lat}    #{@long}"
  end

  def destroy
  #debugger
  @photo = current_user.photos.find(params[:id])
  @photo.destroy
  redirect_to current_user
  end
end