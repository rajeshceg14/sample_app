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
       flash[:notice] = "Photo not selected. Please select a photo"      
       #redirect_to current_user
       redirect_to upload_photo_path(:user => current_user)
    else
      @photo.image = params[:photo][:image]
      if @photo.save
        flash[:notice] = "Photo upload success!"      
        redirect_to current_user
      else        
        puts " UPLOAD FAILED  #{@photo.errors.full_messages}  img content type = #{@photo.errors[:image_content_type]}"        
        if !@photo.errors[:image_content_type].blank?
          flash[:notice] = "Plz upload image"
        elsif !@photo.errors[:image_file_size].blank?
          flash[:notice] = "Photo size must be less than #{Photo::MAX_UPLOAD_SIZE} MB"
        else
          flash[:notice] = "Photo upload failed"          
        end
        #redirect_to current_user
        redirect_to upload_photo_path(:user => current_user)
      end 
    end
  end

  def map_show      
      @user  = User.find( params[:user])
      @photo = @user.photos.find(params[:id])
      @exif  = EXIFR::JPEG.new(@photo.image.path).gps        
      @lat   = @exif.latitude
      @long  = @exif.longitude
      puts "#{@lat}    #{@long}"
  end

  def upload_photo
      @user  = User.find( params[:user])
      @photo = @user.photos.new      
  end

  def photo_delete
    @user = User.find(params[:user])
    @photo = @user.photos.find(params[:id])
    @photo.destroy(:user => @photo.user_id, :id => @photo.id)
    redirect_to @user
  end


  def destroy 
    @user = User.find(params[:user])
    @photo = @user.photos.find(params[:id])
    @photo.destroy
    redirect_to @user
  end
end