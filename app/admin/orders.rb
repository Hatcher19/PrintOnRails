ActiveAdmin.register Order, :sort_order => "end_date_asc" do
	controller.authorize_resource :except => :index

	scope_to :current_manager, :association_method => :orders
	
	menu :label => "Orders"
	
	filter :name, label: "Order Name"
	filter :admin_user, :collection => proc { AdminUser.all.map{|u| [u.last_name, u.id] } }
	filter :order_category, label: "Category"
	filter :order_type, label: "Type"
	filter :order_status, label: "Status"
	filter :order_priority, label: "Priority"
	filter :customer, label: "Customer"
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"
  filter :id, label: "Order ID#"

  controller do
  	#https://github.com/gregbell/active_admin/issues/732
  	#scope index if not admin or sales.
  	def current_manager
      if current_user.broker?
        current_user
      end
		end
  end

	index do 
		selectable_column
		column "ID", :sortable => :id do |order|
			link_to order.id, admin_order_path(order)
		end
		column "Proof" do |order|
			image_tag order.proof_url(:proof).to_s
		end
		column "Name", :sortable => :name do |order|
      link_to order.name, admin_order_path(order)
    end
    column(:customer, :sortable => :customer_id)
    column("Category", :order_category, :sortable => :order_category_id) 
		column("Status", :order_status, :sortable => :order_status_id)
		column("Priority", :order_priority, :sortable => :order_priority_id)
    column("Due Date", :end_date, :sortable => :end_date)
    default_actions
  end
  

  form :partial => "form"

  show :title => :name do
    
    panel "Order Details" do
      attributes_table_for resource do
      	row :id
      	row :admin_user
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
    resource.artworks.each do |a|
			text_node(render :partial => "admin/artworks/show", :locals => { :artwork => a })
    end
    panel "Art Details" do
    	attributes_table_for resource do
	        row :print_location
	        row :color_front
	        row :color_back
	        row :color_sleeve
	        row(:proof) do
	        	image_tag order.proof_url(:thumb).to_s
	        end
	      end
	  end  
	end
end