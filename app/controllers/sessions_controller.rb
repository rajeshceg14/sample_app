class SessionsController < ApplicationController

  def new
  	 if self.current_user != nil
  	 	flash[:error] = "Already signed in as  #{self.current_user.name}. SIGN OUT FIRST"
  	 	redirect_to self.current_user
  	 end
	  
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])

      @signin_return = sign_in user
      if @signin_return == "true"

      	redirect_to root_url	
      else
      	redirect_back_or user		
      end      
    else
      flash.now[:error] = 'Invalid email/password combination'            
      render 'new'
    end
  end

  def destroy
  	puts "SIGN OUT DESTROY CALLED"
    sign_out
    puts "SIGN OUT DONE"
    redirect_to root_url
    #redirect_to 'sign_in'
    #render 'new'
  end
end
