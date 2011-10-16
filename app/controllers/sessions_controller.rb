class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    # Handle the form submission
    # by authenticating user based on user/password combination
    user = User.authenticate(params[:session][:email], params[:session][:password])
    
    if user.nil?
      flash.now[:error] = "Invalid email/password combination"
      @title = "Sign in"
      render "new"
    else
      sign_in user
      redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end

end
