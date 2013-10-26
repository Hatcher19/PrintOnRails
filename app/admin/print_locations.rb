ActiveAdmin.register PrintLocation do
  controller.authorize_resource
  menu :label => "Print Location", :parent => "Settings", :if => proc{ can?(:destroy, Account) }, :priority => 6
  index do
  	column :name
  	default_actions
  end
  
  show :title => :name do
    
    panel "Print Location" do
      attributes_table_for resource do
      	row :name
      end
    end
  end
end
