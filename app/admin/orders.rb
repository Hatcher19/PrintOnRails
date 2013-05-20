ActiveAdmin.register Order do
	controller.authorize_resource


	menu :label => "All Orders", :parent => "Sales", :priority => 2
	
	filter :name, label: "Order Name"
	filter :order_category, label: "Order Category"
	filter :order_type, label: "Order Type"
	filter :order_status, label: "Order Status"
	filter :order_priority, label: "Order Priority"
	filter :customer, label: "Customer"
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"
  filter :id, label: "Order ID#"
  filter :assignee, :collection => proc { AdminUser.all }

	index do 
		column "ID" do |order|
			link_to order.id, admin_order_path(order)
		end
		column "Proof" do |order|
			image_tag order.proof_url(:proof).to_s
		end
		column "Name" do |order|
      link_to order.name, admin_order_path(order)
    end
    column(:customer, :sortable => :customer_id)
		column "Category", :order_category
		column "Status", :order_status
		column "Priority", :order_priority 
    column "Due Date", :end_date
    default_actions
  end
  

  form :partial => "form"

  show :title => :name do
    
    panel "Order Details" do
      attributes_table_for resource do
      	row :id
      	row :assignee_id
        row :name
        row :order_category
        row :order_type
        row :order_status
        row :order_priority
        row :start_date
        row :end_date
      end
    end
	  resource.line_items.each do |a|
	   	text_node(render :partial => "admin/line_items/show", :locals => { :line_item => a })
    end
    panel "Art Details" do
    	attributes_table_for resource do
	        row :print_location
	        row :color_front
	        row :color_back
	        row :color_sleeve
	        row(:artwork) do
	        	image_tag order.artwork_url(:thumb).to_s
	        end
	        row(:proof) do
	        	image_tag order.proof_url(:thumb).to_s
	        end
	      end
	  end  
	end
end