ActiveAdmin.register OrderPriority do
	controller.authorize_resource
	menu :label => "Order Priority", :parent => "Administration"
	filter :name
	filter :weight, :as => :select

	index do 
    column :name 
    column :weight
  end
end