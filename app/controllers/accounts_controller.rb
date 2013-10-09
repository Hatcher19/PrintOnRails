class AccountsController < InheritedResources::Base
	def new
    @account = Account.new
  end

	def create
    @account = Account.new(params[:account])
	end
end