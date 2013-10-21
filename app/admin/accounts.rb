ActiveAdmin.register Account do
	controller.authorize_resource
  	menu :label => "Accounts", :if => proc{ can?(:destroy, Account) }, :priority => 2

	index do 
		column :id
		column :company
	end

	form :partial => "form"
  
end
