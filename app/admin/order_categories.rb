ActiveAdmin.register OrderCategory do
  controller.authorize_resource
	menu :label => "Order Category", :parent => "Administration", :if => proc{ can?(:destroy, OrderCategory) }, :priority => 2
  index do
  	column :name
  	default_actions
  end

  show :title => :name do
    
    panel "Status Details" do
      attributes_table_for resource do
      	row :name
      	row :description
      end
    end
  end
end