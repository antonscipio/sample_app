class UsersController < ApplicationController
  # this is to control the user pages. in show i defined the user variable with the method .find to find the user   

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # this signs the user in straigt after registering
      sign_in @user
      # Handle a succesful save.
      # flash relates to application.html.erb
      flash[:success] = "Welcome to the sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
