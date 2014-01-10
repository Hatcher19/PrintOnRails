ActiveAdmin.register Order, :sort_order => "end_date_asc" do
	controller.authorize_resource
	scope_to :user_account
	menu :label => "Orders"
	actions :all, :except => [:destroy]
	
	scope(:all, default: true)
	scope(:active)
	scope :new do |orders| orders.where(:order_status_id => 1 ) end
	scope(:mine) { |orders| orders.where(:admin_user_id => current_admin_user.id ) }
	scope(:due_today) { |orders| orders.where(:end_date => Date.today.strftime ) }
	scope(:late) { |orders| orders.where('end_date < ?', Date.today) }
	scope :hold
	scope :complete do |orders| orders.where(:order_status_id => 3 ) end

	csv do
		column :id
		column :name
		column("Category"){|order| order.order_category.name }
		column("Status"){|order| order.order_status.name }
		column("product"){|order| order.product_status.name }
		column :end_date
	end

	controller do
		def user_account
			if current_user.role == "broker"
				current_user
			else
				current_user.account
			end
		end
	end

	# needs work
	# filter :account, :collection => proc { Account.all.map{|u| [u.company]}}, :if => proc { can? :destroy, Order }
	filter :name, label: "Order Name"
	filter :guid, label: "Order #"
	filter :admin_user, label: 'Sold By', :collection => proc { AdminUser.where(:account_id => current_admin_user.account_id) }, member_label: Proc.new{ |r| "#{r.first} #{r.last}" }, :if => proc {can? :read, :all}
	filter :order_category, label: "Category"
	filter :order_type, label: "Type"
	filter :order_status, label: "Status"
	filter :product_status, member_label: Proc.new{ |r| r.name.titleize }, label: "Product Status"
	filter :customer, label: "Customer", :collection => proc{ Customer.where(:account_id => current_admin_user.account_id) }, member_label: Proc.new{ |r| r.company.titleize }
	filter :start_date, label: "Start Date"
	filter :end_date, label: "Due Date"

	index do 
		column "#", :sortable => :guid do |order| link_to "#{order.guid}", admin_order_path(order) end
		column "Name", :sortable => :name do |order| link_to order.name, admin_order_path(order) end
		column "Category", :sortable => :order_category_id do |order| order.order_category.name.titleize end
		column("status", :sortable => :order_status_id) do |resource|
			if current_admin_user.role == "broker"
				resource.order_status.name.titleize
			else
				best_in_place resource, :order_status_id, :type => :select, :collection => 
				[[1, "New"], [2, "Approved"], [3, "Complete"], [4, "Hold"], [5, "Cancelled"]], 
				path: [:admin, resource]
			end
		end
		column :art, :sortable => :art_status_id do |resource|
			if current_admin_user.role == "broker"
				resource.art_status.name.titleize
			else
				best_in_place resource, :art_status_id, :type => :select, :collection => 
				[[1, "In Progress"], [2, "Complete"]], path: [:admin, resource]
			end
		end
		column :product, :sortable => :product_status_id do |resource|
			if current_admin_user.role == "broker"
				resource.product_status.name.titleize
			else
				best_in_place resource, :product_status_id, :type => :select, :collection => 
				[[1, "Buy Product"], [2, "Purchased"], [3, "Partial"], [4, "Arrived"]], path: [:admin, resource]
			end
		end
		column("Due Date") do |obj| 
			obj.end_date.strftime("%m/%d/%y") 
		end
		if can? :update, Order
			column 'Edit' do |order| link_to(image_tag('edit.png'), edit_admin_order_path(order)) end
		end
	end
	
	form :partial => "form"

	show :title => "" do
		div :class => "order-name-type" do
			div :class => "order-name" do
				h2 order.name
			end
			div :class => "order-type" do
				h4 " #{order.order_type.name.titleize}"
			end
		end
		br
		div :class => "order-id-user" do
			div :class => "id-user" do
				h3 "##{order.guid}"
			end
			div :class => "admin-user" do
				h6 link_to order.admin_user.email, admin_admin_user_path
			end
		end
		br
		div :class => "top-panel" do
			div :class => "top" do
				panel "Category" do
					h4 order.order_category.name.titleize
				end
			end
			div :class => "top" do
				panel "Start Date" do
					h4 order.created_at.localtime.strftime("%m/%d/%y")
				end
			end
			div :class => "top" do
				panel "Due Date" do
					h4 order.end_date.strftime("%m/%d/%y")
				end
			end
			div :class => "top" do
				panel "Status" do
					if current_admin_user.role == "broker"
						h4 order.order_status.name.titleize
					else
						div :class => "#" do
							div :class => "#" do
								h4 best_in_place resource, :order_status_id, :type => :select, :collection => [[1, "New"], [2, "Approved"], [3, "Complete"], [4, "Hold"], [5, "Cancelled"]] , path: [:admin, resource]
							end
						end
					end
				end
			end
			div :class => "top" do
				panel "Product" do
					if current_admin_user.role == "broker"
						h4 order.product_status.name.titleize
					else
						div :class => "#" do
							div :class => "text-edit-icon" do
								h4 best_in_place order, :product_status_id, :type => :select, :collection => [[1, "Buy Product"], [2, "Purchased"], [3, "Partial"], [4, "Arrived"]], path: [:admin, order]
							end
						end
					end
				end
			end
			div :class => "top" do
				panel "Art" do
					if current_admin_user.role == "broker"
						h4 order.art_status.name.titleize
					else
						div :class => "" do
							h4 best_in_place order, :art_status_id, :type => :select, :collection => [[1, "In Progress"], [2, "Complete"]], path: [:admin, order]
						end
					end
				end
			end
		end
		br
		panel "Product" do
			table_for order.line_items do
				column("Qty") {|resource| quantity = resource.xs.to_i + resource.s.to_i + resource.m.to_i + resource.l.to_i + resource.xl.to_i + resource.xxl.to_i + resource.xxxl.to_i + resource.xxxxl.to_i + resource.vxl.to_i + resource.vixl.to_i } 
				column :style 
				column :color 
				column("Xs") do |line_item| line_item.xs end 
				column("S") do |line_item| line_item.s end  
				column("M") do |line_item| line_item.m end 
				column("L") do |line_item| line_item.l end 
				column("XL") do |line_item| line_item.xl end 
				column("2XL") do |line_item| line_item.xxl end 
				column("3XL") do |line_item| line_item.xxxl end
				column("4XL") do |line_item| line_item.xxxxl end
				column("5XL") do |line_item| line_item.vxl end
				column("6XL") do |line_item| line_item.vixl end
			end
		end
		panel "Artwork" do
			table_for order.artworks do
				column "Thumbnail" do |artwork| image_tag artwork.file_url(:artwork) if artwork.file? end
				column "Download" do |artwork| link_to order.name, artwork.file_url.to_s, download: [order.name,'-',order.id,'-',artwork.location.name] end
				column "Location" do |artwork| artwork.location.name.titleize end
				column "Color" do |artwork| artwork.color end
			end
		end
		active_admin_comments
		panel "History" do
			table_for assigns[:order].versions do
				column "User" do |v| link_to AdminUser.find(v.whodunnit).email, admin_admin_user_path(AdminUser.find(v.whodunnit)) end
				column "Action" do |order| order.event end
				column "Order Attribute" do |order| Order.changeset_string(order.changeset) end
				column "Date/ Time" do |order| order.created_at.localtime.strftime("%m/%d/%y-%I:%M %P") end
			end
		end
	end

	sidebar :customer_info, :class => "customer", only: :show do
		div :class => "customer-row-one" do
			div :class => "customer-icon" do
					image_tag 'building.png'
				end
			div :class => "customer-attribute" do
				h3 link_to "#{order.customer.company}", admin_customer_path 
			end
		end
		div :class => "customer-row-one" do
			div :class => "customer-icon" do
					image_tag 'customer.png'
				end
			div :class => "customer-attribute" do
				h3 order.customer.name
			end
		end
		div :class => "customer-row-one" do
			div :class => "customer-icon" do
					image_tag 'shipping.png'
				end
			div :class => "customer-attribute-one" do
				h3 order.ship ? (image_tag "check.png") : (image_tag "x.png")
			end
		end
		if order.ship
			div :class => "customer-icon" do
					image_tag 'address.png'
				end
			div :class => "customer-street-show" do
				h4 order.customer.street.titleize
			end
			if order.customer.unit?
				div :class => "customer-unit-show" do
					h4 "Apt ##{order.customer.unit}"
				end
			end
			div :class => "city-state-zip" do
				h4 "#{order.customer.city.titleize}, #{order.customer.state.capitalize} #{order.customer.zip}"
			end
		end
	end
	sidebar "Help/ Feedback" do
		h4 "For all questions and/or feedback please email us."
		h1 mail_to "info@printonrails.com", raw(image_tag("email_us.png"))
	end
	# This is for the box label to work. Still working on the views right now.
	# member_action :box_label do
	#   @order = Order.find(params[:id])
	# end
end