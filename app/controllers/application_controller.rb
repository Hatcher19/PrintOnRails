class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'active_admin_views_pages_base.rb' # Override build_footer method in ActiveAdmin::Views::Pages

	def current_user
    current_admin_user
  end
  
  def user_signed_in?
    admin_user_signed_in?
  end

  def current_ability #cancan required!
    @current_ability ||= Ability.new(current_user)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    begin
      redirect_to :back, :alert => exception.message
    rescue ActionController::RedirectBackError
      redirect_to admin_dashboard_path, :alert => exception.message
    end
  end

  def user_for_paper_trail #auditing
    admin_user_signed_in? ? current_admin_user : 'Unknown user'
  end
end