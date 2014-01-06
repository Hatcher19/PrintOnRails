ActiveAdmin.register Customer, :sort_order => "created_at_asc" do
  controller.authorize_resource
  actions :all, :except => [:destroy]
  
  menu :label => "Customers", :if => proc{ can?(:create, Customer) }
  scope(:all, :if => proc{ can?(:read, :all) }) do |customers| customers.where(:account_id => current_admin_user.account_id ) end
  scope(:mine, default: true) {|customers| customers.where(:admin_user_id => current_admin_user.id ) }

  filter :name, label: "by Name"
  filter :admin_user, label: 'Sold By', :collection => proc { AdminUser.where(:account_id => current_admin_user.account_id) }, member_label: Proc.new{ |r| "#{r.first} #{r.last}" }, :if => proc {can? :read, :all}
  filter :company, label: "by Company"
  filter :email, label: "by Email"

  index do
    selectable_column
    column "Name" do |customer|
      link_to customer.name, admin_customer_path(customer)
    end
    column :company
    column :email, :sortable => :email do |customer|
      link_to customer.email, "mailto:#{customer.email}"
    end
    column :phone
    if can? :destroy, Customer 
        column 'Edit' do |customer|
          link_to(image_tag('edit.png'), edit_admin_customer_path(customer))
        end
        column 'Delete' do |customer|
          link_to(image_tag('delete.png'), admin_customer_path(customer), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link")
        end
      elsif 
        column 'Edit' do |customer|
          link_to(image_tag('edit.png'), edit_admin_customer_path(customer))
        end
      end
  end
	  
	form :partial => "form"

  show :title => :company do
    panel "Order History" do
      table_for(customer.orders) do
        column("ID", :sortable => :guid) {|order| link_to "# #{order.guid}", admin_order_path(order) }
        column("Order Name", :sortable => :name) {|order| link_to "#{order.name}", admin_order_path(order) }
        column("Due Date", :sortable => :end_date) {|order| "#{order.end_date}" }
        column("Status") {|order| "#{order.order_status.name}" }
      end
    end
    active_admin_comments
  end
  sidebar "Customer Information", :only => :show do
    attributes_table_for customer do
      row :company
      row :name
      row :email do mail_to "#{customer.email}" end
      row :phone
      row("Sales Rep"){|customer| customer.admin_user}
      row("Customer Since") do |obj|
        obj.created_at.localtime.strftime("%b %d, %Y")
      end
    end
  end
  sidebar "Shipping Information", :only => :show do
    attributes_table_for customer do
      row :street
      row :unit
      row :city
      row :state
      row :zip
    end
  end
end