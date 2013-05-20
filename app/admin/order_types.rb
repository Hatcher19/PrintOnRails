ActiveAdmin.register OrderType do
	controller.authorize_resource
	menu :label => "Order Types", :parent => "Administration"
  end