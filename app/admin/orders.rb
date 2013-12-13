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
    column "Category", :sortable => :order_category_id do |order| order.order_category.name.titleize end
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

  show :title => "" do
    div :class => "order-name-type" do
      div :class => "order-name" do
        h2 order.name
      end
      div :class => "order-type" do
        h4 "(#{order.order_type.name.titleize})"
      end
    end
    br
    div :class => "order-id-user" do
      div :class => "id-user" do
        h3 "##{order.id}"
      end
      div :class => "admin-user" do
        h6 link_to order.admin_user.email, admin_admin_user_path
      end
    end
    br
    div :class => "blocks" do
      div :class => "block" do
        div :class => "block-middle" do
          h3 order.order_category.name.titleize
        end
        div :class => "block-bottom" do
          h4 "Category"
        end
      end
      div :class => "block" do
        div :class => "block-middle" do
          h3 order.created_at.localtime.strftime("%m/%d/%y")
        end
        div :class => "block-bottom" do
          h4 "Start Date"
        end
      end
      div :class => "block" do
        div :class => "block-middle" do
          h3 order.end_date.strftime("%m/%d/%y")
        end
        div :class => "block-bottom" do
          h4 "End Date"
        end
      end
      div :class => "block" do
        div :class => "block-middle" do
          if current_admin_user.role == "broker"
            h3 order.order_status.name.titleize
          else
            div :class => "#" do
              div :class => "text-edit-icon" do
                h3 best_in_place resource, :order_status_id, :type => :select, :collection => [[1, "New"], [2, "Approved"], [3, "Complete"], [4, "Hold"], [5, "Cancelled"]] , path: [:admin, resource]
              end
              div :class => "order-edit-icon" do
                image_tag 'pencil.png'
              end
            end
          end
        end
        br
        div :class => "block-bottom" do
          h4 "Status"
        end
      end
      div :class => "block" do
        div :class => "block-middle" do
          if current_admin_user.role == "broker"
            h3 order.product_status.name.titleize
          else
            div :class => "#" do
              div :class => "text-edit-icon" do
                h3 best_in_place order, :product_status_id, :type => :select, :collection => [[1, "Buy Product"], [2, "Purchased"], [3, "Partial"], [4, "Arrived"]], path: [:admin, order]
              end
              div :class => "order-edit-icon" do
                image_tag 'pencil.png'
              end
            end
          end
        end
        div :class => "block-bottom" do
          h4 "Product"
        end
      end
      div :class => "block" do
        div :class => "block-middle" do
          if current_admin_user.role == "broker"
            h3 order.art_status.name.titleize
          else
            div :class => "#" do
              div :class => "text-edit-icon" do
                h3 best_in_place order, :art_status_id, :type => :select, :collection => [[1, "In Progress"], [2, "Complete"]], path: [:admin, order]
              end
              div :class => "order-edit-icon" do
                image_tag 'pencil.png'
              end
            end
          end
        end
        div :class => "block-bottom" do
          h4 "Artwork"
        end
      end
    end
    panel "Line Item" do
      table_for order.line_items do
        column :quantity 
        column :style 
        column :color 
        column :s 
        column :m 
        column :l 
        column :xl 
        column :xxl 
        column :xxxl 
        column :xxxxl 
      end
    end
    panel "Artwork" do
      table_for order.artworks do
        column "" do |artwork| image_tag artwork.file_url(:artwork) if artwork.file? end
        column "Download" do |artwork| link_to order.name, artwork.file_url.to_s, download: [order.name,'-',order.id,'-',artwork.print_location.name] end
        column "Location" do |artwork| artwork.print_location.name.titleize end
        column "Color" do |artwork| artwork.color end
      end
    end
	  active_admin_comments
    panel "History" do
      table_for assigns[:order].versions do
        column "User" do |v| link_to AdminUser.find(v.whodunnit).email, admin_admin_user_path(AdminUser.find(v.whodunnit)) end
        column "Event" do |order| order.event end
        column "Attribute" do |order| Order.changeset_string(order.changeset) end
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
      div :class => "customer-unit-show" do
        h4 order.customer.unit
      end
      div :class => "city-state-zip" do
        h4 "#{order.customer.city.titleize}, #{order.customer.state.titleize} #{order.customer.zip}"
      end
    end
  end

  member_action :history do
    @order = Order.find(params[:id])
    @versions = @order.versions
  end
end