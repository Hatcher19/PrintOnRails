ActiveAdmin.register PrintLocation do
	controller.authorize_resource
  menu :label => "Print Locations", :parent => "Administration"
end
