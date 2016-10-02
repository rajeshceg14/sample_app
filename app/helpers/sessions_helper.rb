module SessionsHelper
   def sign_in(user)
    if self.current_user == nil
   		puts "SIGNING IN................."           
	    cookies.permanent[:remember_token] = user.remember_token
	    self.current_user = user
	    return "false"
	else
		puts " SIGNED IN "
		#flash[:error] = "Already signed in as  #{self.current_user.name}."
		return "true"
	end
  end

  def get_current_session_user
    return self.current_user
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
  	!current_user.nil?
  end


    

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    puts "COOKIES DELETED"
  end

end
