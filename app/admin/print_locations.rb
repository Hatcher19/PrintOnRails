ActiveAdmin.register PrintLocation do
  controller.authorize_resource
  menu :label => "Print Locations", :parent => "Administration"
  index do
  	column :name
  	default_actions
  end
  
  show :title => :name do
    
    panel "Print Location" do
      attributes_table_for resource do
      	row :name
      	row :description
      end
    end
  end
end
