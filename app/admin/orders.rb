ActiveAdmin.register Order, :sort_order => "end_date_asc" do
  scope_to :current_manager, :association_method => :orders
  controller.authorize_resource :except => :index
  
  scope(:active, default: true)
  scope :new, :if => proc {can? :create, :admin_user} do |orders| orders.where(:order_status_id => 1 ) end
  scope(:mine) { |orders| orders.where(:admin_user_id => current_admin_user.id ) }
  scope(:due_today) { |orders| orders.where(:end_date => Date.today ) }
  scope(:late) { |orders| orders.where('end_date < ?', Date.today) }
  scope :complete do |orders| orders.where(:order_status_id => 6 ) end

  controller do
    def current_manager
      unless can? :read, :all
        current_user
      end
    end
  end


  menu :label => "Orders"

  filter :name, label: "Order Name"
  filter :admin_user, label: 'Sold By', :collection => proc { AdminUser.all.map{|u| [u.last] } }
  filter :order_category, label: "Category"
  filter :order_type, label: "Type"
  filter :order_status, label: "Status"
  filter :product_status, label: "Product Status"
  filter :order_priority, label: "Priority"
  filter :customer, label: "Customer"
  filter :ship, as: :select, label: "Is Order Shipping?"
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"
  filter :id, label: "Order ID#"

  

  index do 
    column "ID", :sortable => :id do |order| link_to order.id, admin_order_path(order) end
    column "Name", :sortable => :name do |order| order.name end
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
    column 'Edit' do |order|
      link_to(image_tag('edit.png'), edit_admin_order_path(order))
    end
  end
  
  form :partial => "form"

  show :title => :id do
    
    panel "Shipping Details" do
      attributes_table_for resource do
        row :ship
      end
    end

    resource.artworks.each do |a|
        text_node(render :partial => "admin/artworks/show", :locals => { :artwork => a })
    end

  	resource.line_items.each do |a|
	   	text_node(render :partial => "admin/line_items/show", :locals => { :line_item => a })
    end 
    #panel "History" do
    #  render :partial => "admin/orders/history"
    #end
    
	  active_admin_comments
	end
end