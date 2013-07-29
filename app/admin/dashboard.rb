ActiveAdmin::Dashboards.build do
  section "Recent Orders" do
    table_for Order.order("id desc").limit(10) do
      column :id
      column "Name" do |order|
        link_to order.name, admin_order_path(order)
      end
      column :order_category
      column :order_status
      column :order_priority
      column :end_date
    end
    strong { link_to "View All Orders", admin_orders_path }
  end
  section "Recent Customers" do
    table_for Customer.owned_by(current_admin_user).limit(5) do
      column "Name" do |customer| 
        link_to customer.name, admin_customers_path(customer)
      end
      column :phone
      column :email, :sortable => :email do |customer|
        link_to customer.email, "mailto:#{customer.email}"
      end
    end
    strong { link_to "View All Customers", admin_customers_path }
  end
  
end
