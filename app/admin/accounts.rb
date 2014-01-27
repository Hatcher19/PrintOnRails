ActiveAdmin.register Account do
	controller.authorize_resource
  	menu :label => "Accounts", :if => proc{ can?(:destroy, Account) }, :priority => 2

	index do 
		column :id
		column :company
		column :orders do |account| account.orders.count end
		column :customers do |account| account.customers.count end
		column :Users do |account| account.admin_users.count end
		# column(:email, sortable: :email) {|account| account.admin_user.where( role == "account_admin").email(account)}
	end

	form :partial => "form"
  
end
