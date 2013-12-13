ActiveAdmin::Dashboards.build do

	section "New Orders", :if => proc{ can?(:update, Order) }, priority: 1 do
		table_for Order.where(:account_id => current_admin_user.account_id, :order_status_id => 1).limit(20) do
			column "Id" do |order| link_to order.id, admin_order_path(order) end
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
	section "Recently Completed", :if => proc{ can?(:update, Order) }, priority: 1 do
		table_for Order.where(:account_id => current_admin_user.account_id, :order_status_id => 3).limit(20) do
			column "Id" do |order| link_to order.id, admin_order_path(order) end
			column "Name" do |order| link_to order.name, admin_order_path(order) end
			column "User" do |order| order.admin_user.email end
			column "Status" do |order| order.order_status.name end
		end
	end
	# section "Recently updated", :if => proc{ can?(:update, Order) }, priority: 2 do
	# 	table_for Order.where(:account_id => current_admin_user.account_id).limit(20) do
	# 		column "Id" do |order| link_to order.id, admin_order_path(order) end
	# 		column "Name" do |order| link_to order.name, admin_order_path(order) end
	# 		column "Updated At" do |order| order.updated_at end
	# 		column "User" do |order| order.admin_user.email end
	# 	end
	# end
	section "My Orders", priority: 3 do
		table_for Order.where(:admin_user_id => current_admin_user.id).limit(20) do
			column "Id" do |order| link_to order.id, admin_order_path(order) end
			column "Name" do |order| link_to order.name, admin_order_path(order) end
			column "Due Date" do |obj|
	          obj.end_date.strftime("%m/%d/%y")
	        end
			column "Status" do |order| order.order_status.name end
		end
	end
end