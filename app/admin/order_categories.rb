ActiveAdmin.register OrderCategory do
  controller.authorize_resource
	menu :label => "Order Category", :parent => "Settings", :if => proc{ can?(:destroy, Account) }, :priority => 2
  index do
    column :id
  	column :name
  end

  show :title => :name do
    
    panel "Status Details" do
      attributes_table_for resource do
      	row :name
      end
    end
  end
end