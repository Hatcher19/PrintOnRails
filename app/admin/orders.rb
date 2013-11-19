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
  scope :complete do |orders| orders.where(:order_status_id => 6 ) end

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
    column :status, :sortable => :order_status_id do |resource|
      best_in_place resource, :order_status_id, :type => :select, :collection => 
      [[1, "New"], [2, "Approved"], [3, "Art"], [4, "Setup"], [5, "Printing"], 
      [6, "Complete"], [7, "Hold"], [8, "Cancelled"]] , path: [:admin, resource]
    end
    column :product, :sortable => :product_status_id do |resource|
      best_in_place resource, :product_status_id, :type => :select, :collection => 
      [[1, "Please Order!"], [2, "Ordered"], [3, "Partial"], [4, "Arrived"]], path: [:admin, resource]
    end
    column("Due", :end_date, :format => :short, :sortable => :end_date)
      if can? :create, Order
        column 'Edit' do |order| link_to(image_tag('edit.png'), edit_admin_order_path(order)) end
      end
  end
  
  form :partial => "form"

  show :title => :id do
    panel 'Order Information' do
      attributes_table_for order do
        row :name
        row("Category"){|order| order.order_category.name }
        row("Type"){|order| order.order_type.name }
        row :admin_user
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
    attributes_table_for resource do
      if current_admin_user.role == "broker"
        row :status do |resource|
          best_in_place resource, :order_status_id, :type => :select, :collection => 
          [[7, "Hold"], [8, "Cancelled"]] , path: [:admin, resource]
        end
        row :product_status do |order|
          best_in_place order, :product_status_id, :type => :select, :collection => 
          [[1, "Please Order!"], [2, "Ordered"], [3, "Partial"], [4, "Arrived"]], path: [:admin, order]
        end
      else
        row :status do |resource|
          best_in_place resource, :order_status_id, :type => :select, :collection => 
          [[1, "New"], [2, "Approved"], [3, "Art"], [4, "Setup"], [5, "Printing"], 
          [6, "Complete"], [7, "Hold"], [8, "Cancelled"]] , path: [:admin, resource]
        end
        row :product_status do |order|
          best_in_place order, :product_status_id, :type => :select, :collection => 
          [[1, "Please Order!"], [2, "Ordered"], [3, "Partial"], [4, "Arrived"]], path: [:admin, order]
        end
      end
    end
  end

  sidebar :Shipping_information, only: [:show] do
    attributes_table_for resource do
      row :customer_id 
      # if order.ship 
      #   row :ship
      # end
      row :ship
    end
  end
end