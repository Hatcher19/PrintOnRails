ActiveAdmin.register Customer do
  controller.authorize_resource
	# Menu item
  menu :label => "Customers", :parent => "Sales"

  filter :name, label: "by Name"
  filter :company, label: "by Company"
  filter :email, label: "by Email"
  filter :phone, label: "by Phone Number"

  index do
    column "Name" do |customer|
      link_to customer.name, admin_customer_path(customer)
    end
    column :company
    column :email, :sortable => :email do |customer|
      link_to customer.email, "mailto:#{customer.email}"
    end
    column :phone
    default_actions
  end
	  
	form :partial => "form"
  
  show :title => :name do
    
    panel "Customer Details" do
	      attributes_table_for resource do
	        row :name
	        row :company
	        row :email
	        row :phone
	      end
	  end
    
    resource.addresses.each do |a|
	   text_node(render :partial => "admin/addresses/show", :locals => { :address => a })
    end
	end
end