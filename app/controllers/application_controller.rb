class ApplicationController < ActionController::Base

	def current_user
    current_admin_user
  end
  
  def user_signed_in?
    admin_user_signed_in?
  end


  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
  
  rescue_from CanCan::AccessDenied do |exception|
    begin
      redirect_to :back, :alert => exception.message
    rescue ActionController::RedirectBackError
      redirect_to dashboard_path, :alert => exception.message
    end
  end
 
	
  protect_from_forgery
  helper_method :subdomain, :current_account
    before_filter :validate_subdomain #:authenticate_user!

    private # ----------------------------------------------------

    def current_account
        # The where clause is assuming you are using Mongoid, change appropriately
        # for ActiveRecord or a different supported ORM.
        @current_account ||= Account.where(subdomain: subdomain).first
    end

    def subdomain
        request.subdomain
    end

    # This will redirect the user to your 404 page if the account can not be found
    # based on the subdomain.  You can change this to whatever best fits your
    # application.
    def validate_subdomain
        unless current_controller == 'pages' || current_controller == 'devise/registrations'
          redirect_to '/404.html' if current_account.nil?
        end

    end

    def current_controller
      p params[:controller]
      params[:controller]
    end
end
