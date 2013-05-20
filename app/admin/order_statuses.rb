ActiveAdmin.register OrderStatus do
	controller.authorize_resource
  menu :label => "Order Status", :parent => "Administration"
end
