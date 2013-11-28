ActiveAdmin.register Order, :sort_order => "end_date_asc" do
  controller.authorize_resource
  scope_to :user_account
  menu :label => "Orders"
  
  scope(:active, default: true)
  scope :new do |orders| orders.where(:order_status_id => 1 ) end
  scope(:mine) { |orders| orders.where(:admin_user_id => current_admin_user.id ) }
  scope(:due_today) { |orders| orders.where(:end_date => Date.today ) }
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
  filter :id, label: "Order ID#"
  filter :admin_user, label: 'Sold By', :collection => proc { AdminUser.all.map{|u| [u.last] } }
  filter :order_category, label: "Category"
  filter :order_type, label: "Type"
  filter :order_status, label: "Status"
  filter :product_status, label: "Product Status"
  filter :customer, label: "Customer"
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"

  index do 
    column "ID", :sortable => :id do |order| link_to order.id, admin_order_path(order) end
    column "Name", :sortable => :name do |order| link_to order.name, admin_order_path(order) end
    column("Category", :order_category, :sortable => :order_category_id)
    column("status", :sortable => :order_status_id) do |resource|
      best_in_place resource, :order_status_id, :type => :select, :collection => 
      [[1, "New"], [2, "Approved"], [3, "Complete"], [4, "Hold"], [5, "Cancelled"]], 
      path: [:admin, resource]
    end
    column :art, :sortable => :art_status_id do |resource|
      best_in_place resource, :art_status_id, :type => :select, :collection => 
      [[1, "In Progress"], [2, "Complete"]], path: [:admin, resource]
    end
    column :product, :sortable => :product_status_id do |resource|
      best_in_place resource, :product_status_id, :type => :select, :collection => 
      [[1, "Buy Product"], [2, "Purchased"], [3, "Partial"], [4, "Arrived"]], path: [:admin, resource]
    end
    column("Due Date") do |obj| 
      obj.end_date.strftime("%m/%d/%y") 
    end
    if can? :update, Order
      column 'Edit' do |order| link_to(image_tag('edit.png'), edit_admin_order_path(order)) end
    end
  end
  
  form :partial => "form"

  show :title => :id do
    panel 'Order Information' do
      attributes_table_for order do
        row :name
        row("Due Date") do |obj| 
          obj.end_date.strftime("%b %d, %Y") 
        end
        row :created_at do |obj|
          obj.created_at.localtime.strftime("%b %d, %Y %I:%M %P")
        end
        row("Category"){|order| order.order_category.name.humanize }
        row("Type"){|order| order.order_type.name.humanize }
        row("Sold by"){|order| order.admin_user}
      end
    end
    resource.line_items.each do |a|
      text_node(render :partial => "admin/line_items/show", :locals => { :line_item => a })
    end 
    resource.artworks.each do |a|
        text_node(render :partial => "admin/artworks/show", :locals => { :artwork => a })
    end
	  active_admin_comments
	end
  sidebar :status, only: [:show, :edit] do
      if current_admin_user.role == "broker"
        attributes_table_for(order.order_status) do
          row("Status"){|order_status| order_status.name.humanize}
        end
        attributes_table_for(order.product_status) do
          row("Product"){|product_status| product_status.name.humanize}
        end
        attributes_table_for(order.art_status) do
          row("Artwork"){|art_status| art_status.name.humanize}
        end
      else
        attributes_table_for resource do
        row :status do |resource|
          best_in_place resource, :order_status_id, :type => :select, :collection => 
          [[1, "New"], [2, "Approved"], [3, "Complete"], [4, "Hold"], [5, "Cancelled"]] , path: [:admin, resource]
        end
        row :product_status do |order|
          best_in_place order, :product_status_id, :type => :select, :collection => 
          [[1, "Buy Product"], [2, "Purchased"], [3, "Partial"], [4, "Arrived"]], path: [:admin, order]
        end
        row :art do |order|
          best_in_place order, :art_status_id, :type => :select, :collection => 
          [[1, "In Progress"], [2, "Complete"]], path: [:admin, order]
        end
      end
    end
  end

  sidebar :customer_information, only: :show do
    attributes_table_for resource do
      row :customer_id 
      row :ship
    end
    if order.ship
      attributes_table_for(order.customer) do
        row("street"){|customer| customer.street}
        row("Unit"){|customer| customer.unit}
        row("city"){|customer| customer.city}
        row("state"){|customer| customer.state}
        row("zip"){|customer| customer.zip}
      end
    end
  end
end