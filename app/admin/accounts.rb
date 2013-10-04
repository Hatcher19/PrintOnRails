ActiveAdmin.register Account do
	controller.authorize_resource

	menu 

	index do 
		column :id
		column :company
	end

	form :partial => "form"
  
end
