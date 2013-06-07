ActiveAdmin.register OrderPriority do
	controller.authorize_resource
	menu :label => "Order Priority", :parent => "Administration"
	index do
  	column :name
    column :priority 
  	default_actions
  end

  form :partial => "form"
  
  show :title => :name do
    
    panel "Priority Details" do
      attributes_table_for resource do
      	row :name
      	row :priority
      	row :description
      end
    end
  end
end