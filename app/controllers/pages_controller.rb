class PagesController < ApplicationController
  def home
  	@orders = Order.all
  	@admin_users = AdminUser.all
  end
  def role

  end
end
