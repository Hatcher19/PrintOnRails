ActiveAdmin.register Customer do
	# Menu item
  menu :label => "Customers", :parent => "Administration"

  filter :name, label: "by Name"
  filter :company, label: "by Company"
  filter :email, label: "by Email"
  filter :phone, label: "by Phone Number"

  index do
    column :name
    column :company
    column :email
    column :phone
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
	  text_node(render :partial => "admin/addresses/form", :locals => { :addresses => resource.address })
	end
end