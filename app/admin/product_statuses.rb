ActiveAdmin.register ProductStatus do
	controller.authorize_resource
  menu :label => "Product Status", :parent => "Administration", :if => proc{ can?(:create, ProductStatus) }, :priority => 6

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
