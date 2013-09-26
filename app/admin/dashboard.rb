ActiveAdmin::Dashboards.build do
# app/admin/dashboard.rb
	section "Recently updated Orders", :priority => 1 do
	  table_for Version.order('id desc').limit(50) do # Use PaperTrail::Version if this throws an error
	    #column "Item" do |v| v.item end
	    column "ID" do |v| link_to v.item.id, [:admin, v.item] end
	    column "Edit Date" do |v| v.created_at.to_s :long end
	    column "User" do |v| link_to AdminUser.find(v.whodunnit).full_name, admin_admin_user_path(AdminUser.find(v.whodunnit)) end
	  end
	end
end