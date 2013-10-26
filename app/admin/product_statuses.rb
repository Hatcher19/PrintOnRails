ActiveAdmin.register ProductStatus do
	controller.authorize_resource
  menu :label => "Product Status", :parent => "Settings", :if => proc{ can?(:destroy, Account) }, :priority => 6

  index do
  	column :name
  	column :active
  	default_actions
  end

  show :title => :name do
    
    panel "Status Details" do
      attributes_table_for resource do
      	row :name
      	row :active
      end
    end
  end
  
end
