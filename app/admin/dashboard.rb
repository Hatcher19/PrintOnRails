ActiveAdmin::Dashboards.build do
	  ###################################  
	  # Welcome widgets
	  ###################################
	  
	  section "Getting Started", priority: 1,  :id => 'green', priority: 1 do
	    div :class => "welcome-red", :id => "red" do 'Welcome to Print On Rails!' end
    	div  :id => "green" do 'Getting Started' end

	    columns :class => "dashboard-columns", :id => "blue" do
	    	column :class => "dashboard-column" do
	    		span :class => "dashboard-span" do image_tag 'new_user.png' end
    			span :class => "dashboard-span" do link_to "New User", new_admin_admin_user_path end
	    	end
	    end
	    columns :class => "dashboard-columns" , :id => "red-background" do
	    	column :class => "dashboard-column" do
	    		span :class => "dashboard-span" do image_tag 'new_order.png' end
    			span :class => "dashboard-span" do link_to "New Order", new_admin_order_path end
	    	end
	    end
	    columns :class => "dashboard-columns" , :id => "purple-background" do
	    	column :class => "dashboard-column" do
	    		span :class => "dashboard-span" do image_tag 'new_customer.png' end
    			span :class => "dashboard-span" do link_to "New Customer", new_admin_order_path end
	    	end
	    end
	  end

	  ###################################  
	  # Account level 
	  ###################################

	section "New Orders", :if => proc{ can?(:update, AdminUser) } do
		table_for Order.where(:account_id => current_admin_user.account_id, :order_status_id => 1).order("created_at desc").limit(10) do
			column "Id" do |order| link_to order.guid, admin_order_path(order) end
			column "Name" do |order| link_to order.name, admin_order_path(order) end
			column "Created At" do |obj|
	          obj.created_at.localtime.strftime("%m/%d/%y %I:%M %P")
	        end
			column "User" do |order| order.admin_user.email end
			column("status", :sortable => :order_status_id) do |resource|
		      best_in_place resource, :order_status_id, :type => :select, :collection => 
		      [[1, "New"], [2, "Approved"], [3, "Complete"], [4, "Hold"], [5, "Cancelled"]], 
		      path: [:admin, resource]
		    end
		end
	end
	section "My Orders", :if => proc{ can?(:create, Order) } do
		table_for Order.where(:admin_user_id => current_admin_user.id).order("created_at desc").limit(10) do
			column "Id" do |order| link_to order.guid, admin_order_path(order) end
			column "Name" do |order| link_to order.name, admin_order_path(order) end
			column "Due Date" do |obj|
	          obj.end_date.strftime("%m/%d/%y")
	        end
			column "Status" do |order| order.order_status.name end
			column "Status" do |order| link_to new_admin_admin_user_path end
		end
	end
end



	# section "Recently Completed", :if => proc{ can?(:update, Order) }, priority: 2 do
	# 	table_for Order.where(:account_id => current_admin_user.account_id, :order_status_id => 3).limit(5) do
	# 		column "Id" do |order| link_to order.id, admin_order_path(order) end
	# 		column "Name" do |order| link_to order.name, admin_order_path(order) end
	# 		column "User" do |order| order.admin_user.email end
	# 		column "Status" do |order| order.order_status.name end
	# 	end
	# end
	# section "Recently updated", :if => proc{ can?(:update, Order) }, priority: 2 do
	# 	table_for Order.where(:account_id => current_admin_user.account_id).limit(5) do
	# 		column "Id" do |order| link_to order.id, admin_order_path(order) end
	# 		column "Name" do |order| link_to order.name, admin_order_path(order) end
	# 		column "Updated At" do |order| order.updated_at end
	# 		column "User" do |order| order.admin_user.email end
	# 	end
	# end