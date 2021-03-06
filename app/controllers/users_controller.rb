class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user_func, only: :destroy


  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end


  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  def new
    puts "Calling SIGNUP #{get_current_user}"
    @user = get_current_user
    if @user != nil
      flash[:error] = "Already signed in as  \"#{@user.name}\". SIGN OUT FIRST and signup"
      redirect_to @user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @signin_return = sign_in @user
      if @signin_return == "true"
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        redirect_to @user
      end
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end


  def update    
    @user = User.find(params[:id])
    puts "USER CONTROLLER UPDATE CALLED"
    if @user.update_attributes(params[:user])
      puts "USER CONTROLLER UPDATE PASSED"
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user

      # Handle a successful update.
    else
      puts "USER CONTROLLER UPDATE FAILED"
      render 'edit'
    end
  end


  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  def destroy
    puts "DESTROY USER FUNC CALLED"
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

    def get_current_user
      return get_current_session_user      
    end

    def current_user?(user)
      user == current_user
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user_func      
      puts "ADMIN USER FUNC CALLED"
      #puts #{current_user.admin_user}
      redirect_to(root_url) unless current_user.admin? 
    end



end
