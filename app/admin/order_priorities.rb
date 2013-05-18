ActiveAdmin.register OrderPriority do
	menu :label => "Order Priority", :parent => "Administration"
	filter :name
	filter :weight, :as => :select

	index do 
    column :name 
    column :weight
  end
end