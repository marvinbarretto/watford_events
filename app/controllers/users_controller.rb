class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    # Just to see what params[:user] looks like
    # raise params[:user].inspect
    
    @user = User.new(params[:user])
    if @user.save
      # Refactor below: redirect_to user_path(@user)
      
      redirect_to @user, :flash => { :success => "Welcome to Watford Events" }
    else  
      @title = "Sign up"
      render 'new'
    end
    
  end
  
end
