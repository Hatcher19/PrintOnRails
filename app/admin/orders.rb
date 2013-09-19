ActiveAdmin.register Order, :sort_order => "end_date_asc" do
  controller.authorize_resource :except => :index

  scope_to :current_manager, :association_method => :orders

  menu :label => "Orders"

  filter :name, label: "Order Name"
  filter :admin_user, :collection => proc { AdminUser.all.map{|u| [u.last_name, u.id] } }
  filter :order_category, label: "Category"
  filter :order_type, label: "Type"
  filter :order_status, label: "Status"
  filter :order_priority, label: "Priority"
  filter :customer, label: "Customer"
  filter :ship, as: :select, label: "Is Order Shipping?"
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"
  filter :id, label: "Order ID#"

  controller do
    def current_manager
      unless can? :read, :all
        current_user
      end
    end
  end

  index do 
    selectable_column
      column "#", :sortable => :id do |order|
        link_to order.id, admin_order_path(order)
      end
      column "Proof" do |order|
        image_tag order.proof_url(:proof).to_s
      end
      column "Name", :sortable => :name do |order|
        link_to order.name, admin_order_path(order)
      end
      column(:customer, :sortable => :customer_id)
      column "Ship?" do |order|
        if order.ship == true 
          image_tag 'ship.png'
        elsif order.ship == false 
        end
      end
      column("Category", :order_category, :sortable => :order_category_id) 
      column("Status", :order_status, :sortable => :order_status_id)
      column("Priority", :order_priority, :sortable => :order_priority_id)
      column("Due", :end_date, :format => :short, :sortable => :end_date)
      if can? :destroy, Order 
        column '' do |order|
          link_to(image_tag('edit.png'), edit_admin_order_path(order))
        end
        column '' do |order|
          link_to(image_tag('delete.png'), admin_order_path(order), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link")
        end
      elsif can? :edit, Order
        column '' do |order|
          link_to(image_tag('edit.png'), edit_admin_order_path(order))
        end
      end
  end
  
  form :partial => "form"

  show :title => :id do
    panel order.name do
      div :class => "attributes_table" do
        table :for => resource do |t|
          tr do
            th { 'Customer' }
            td { link_to resource.customer.name, admin_customer_path(resource.customer) }
            th { 'Category' }
            td { link_to resource.order_category.name, admin_order_category_path(resource.order_category) }
          end
          tr do
            th { 'User' }
            td { link_to resource.admin_user.email, admin_admin_user_path(resource.admin_user) }
            th { 'Status' }
            td { link_to resource.order_status.name, admin_order_status_path(resource.order_status) }
          end
          tr do
            th { 'Start Date' }
            td { link_to order.created_at.to_s.humanize }
            th { 'Type' }
            td { link_to resource.order_type.name, admin_order_type_path(resource.order_type) }
          end
          tr do
            th { 'Due Date' }
            td { link_to order.end_date }
            th { 'Priority'}
            td { link_to resource.order_priority.name, admin_order_priority_path(resource.order_priority) }
          end
        end
      end
    end

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

    attributes_table do
        row :proof do
          image_tag(order.proof.url)
        end
    end
	  active_admin_comments
	end
end





