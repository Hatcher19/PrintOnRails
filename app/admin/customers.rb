ActiveAdmin.register Customer, :sort_order => "created_at_asc" do
  controller.authorize_resource
  scope_to :user_account
  menu :label => "Customers", :if => proc{ can?(:create, Customer) }
  scope(:all) { |customers| customers }
  scope(:mine, default: true) { |customers| customers.where(:admin_user_id => current_admin_user.id ) }

  controller do
    def user_account
      if current_user.role == "broker"
        current_user
      else
        current_user.account
      end
    end
  end


  filter :name, label: "by Name"
  filter :admin_user, :collection => proc { AdminUser.all.map{|u| [u.last, u.id] } }
  filter :company, label: "by Company"
  filter :email, label: "by Email"
  filter :phone, label: "by Phone Number"

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
        column("ID", :sortable => :id) {|order| link_to "# #{order.id}", admin_order_path(order) }
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
      row("User") {|customer| link_to "#{customer.admin_user.email}", admin_admin_user_path(customer)}
      row('customer since') {|customer| customer.created_at }
    end
  end
  sidebar "Addresses", :only => :show do
    resource.addresses.each do |a|
     text_node(render :partial => "admin/addresses/show", :locals => { :address => a })
    end
  end
end