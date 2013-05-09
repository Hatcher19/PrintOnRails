ActiveAdmin.register Order do
	
	filter :name, label: "Order Name"
	filter :order_category, label: "Order Category"
	filter :order_type, label: "Order Type"
	filter :order_status, label: "Order Status"
	filter :order_priority, label: "Order Priority"
	filter :customer, :collection => proc { Customer.all }
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"

	index do
		column :order_category
		column :order_type
		column :order_status
		column :order_priority
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
	        row :order_category
	        row :order_type
	        row :order_status
	        row :order_priority
	        row :start_date
	        row :end_date
	        row :color_front
	        row :color_back
	        row :color_sleeve
	      end
	  end
	end
end