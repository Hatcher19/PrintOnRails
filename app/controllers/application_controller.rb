class ApplicationController < ActionController::Base

	def current_user
    current_admin_user
  end
  
  def user_signed_in?
    admin_user_signed_in?
  end
 
	
  protect_from_forgery
end
