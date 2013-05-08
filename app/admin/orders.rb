ActiveAdmin.register Order do

	
	filter :name, label: "Order Name"
	filter :customer, :collection => proc { Customer.all }
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"

	index do
		column "Name" do |order|
      link_to order.name, admin_order_path(order)
    end
    column(:customer, :sortable => :customer_id) 
    column :end_date
  end

  show :title => :name do
    
    panel "Customer Details" do
	      attributes_table_for resource do
	        row :name
	        row :start_date
	        row :end_date
	        row :color_front
	        row :color_back
	        row :color_sleeve
	      end
	  end
	end
end