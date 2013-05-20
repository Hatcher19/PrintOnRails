ActiveAdmin.register OrderCategory do
	controller.authorize_resource

	menu :label => "Order Category", :parent => "Administration"
  filter :name
end