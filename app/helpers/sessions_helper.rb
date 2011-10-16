module SessionsHelper

  def sign_in(user)
    # secure permanent cookie
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
  # setter method (defined explicitly)
  def current_user=(user)
    @current_user = user
  end
  
  # getter method
  # or equals: if @current_user = nil then assign it with user_from...
  # prevents multiple hits to the database 
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
    
  end
  
  private
  
  def user_from_remember_token
    # Add a class method to User model
    
    #remember_token is an array with 2 elements
    #Use * to effecitvely unrwaps it to make two arguments
    User.authenticate_with_salt(*remember_token)
  end
  
  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end
  
end
