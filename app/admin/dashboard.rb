ActiveAdmin::Dashboards.build do
	section "New Orders", :priority => 1 do
		table_for Order.where(:account_id => current_admin_user.account_id, :order_status_id => 1) do
			column "Id" do |order| link_to order.id, admin_order_path(order) end
			column "Name" do |order| link_to order.name, admin_order_path(order) end
			column "Created At" do |order| order.created_at end
			column "User" do |order| order.admin_user.email end
			column "Status" do |order| order.order_status.name end
		end
	end
	section "Recently updated" do
		table_for Order.where(:account_id => current_admin_user.account_id) do
			column "Id" do |order| order.id end
			column "name" do |order| order.name end
			column "Name" do |order| order.updated_at end
			column "User" do |order| order.admin_user.email end
		end
	end
end