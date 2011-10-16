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
      # Handle successful signin
    end
  end
  
  def destroy
    
  end

end
