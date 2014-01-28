ActiveAdmin.register Account do
	controller.authorize_resource
  	menu :label => "Accounts", :if => proc{ can?(:destroy, Account) }, :priority => 2

	index do 
		column "ID", :sortable => :id do |account| link_to account.id, admin_account_path(account) end
		column "Company", :sortable => :company do |account| link_to account.company, admin_account_path(account) end
		column :orders do |account| account.orders.count end
		column :customers do |account| account.customers.count end
		column :Users do |account| account.admin_users.count end
		# column(:email, sortable: :email) {|account| account.admin_user.where( role == "account_admin").email(account)}
	end

	form :partial => "form"

	show do
		div do
			div do
				h2 account.company
				h2 account.orders.count
				h2 account.admin_users.count
				h2 account.customers.count

			end
		end
	end
  
end
