ActiveAdmin::Dashboards.build do
	section "Recently updated Orders", :priority => 1 do
	  table_for Version.order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
	    column "Item" do |v| link_to Order.find(v.item), [:admin, v.item] end # Uncomment to display as link
	    column "Modified at" do |v| v.created_at.to_s :long end
	    column "User" do |v| link_to AdminUser.find(v.whodunnit).email, admin_admin_user_path(AdminUser.find(v.whodunnit)) end
	  end
	end
	section "New Orders", :priority => 2 do
		table_for Order.limit(20) do
			column "Id" do |order| link_to order.id, admin_order_path(order) end
		end
	end
end