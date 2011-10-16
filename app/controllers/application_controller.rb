class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # By default helpers are only avaliable in views, not controllers
  include SessionsHelper
end
