ActiveAdmin::Dashboards.build do
	section "New Orders", :priority => 1 do
		table_for Order.limit(20) do
			column "Id" do |order| link_to order.id, admin_order_path(order) end
			column "Name" do |order| link_to order.name, admin_order_path(order) end
			column "Created At" do |order| order.created_at end
			column "User" do |order| order.admin_user.email end
		end
	end
	section "Recently updated" do
		table_for Order.limit(20) do
			column "Id" do |order| order.id end
			column "name" do |order| order.name end
			column "Name" do |order| order.updated_at end
			column "User" do |order| order.admin_user.email end
		end
	end
end