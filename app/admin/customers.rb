ActiveAdmin.register Customer do
  controller.authorize_resource :except => :index

	# Menu item
  menu :label => "Customers"

  scope(:all, default: true) { |customers| customers }
  scope(:mine) { |customers| customers.where(:admin_user_id => current_admin_user.id ) }

  filter :name, label: "by Name"
  filter :admin_user, :collection => proc { AdminUser.all.map{|u| [u.full_name, u.id] } }
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
  
  show :title => :name do
    
    panel "Customer Details" do
        attributes_table_for resource do
          row :name
          row :admin_user
          row :company
          row :email
          row :phone
        end
    end
    
    resource.addresses.each do |a|
	   text_node(render :partial => "admin/addresses/show", :locals => { :address => a })
    end

    #panel "Previous Orders" do 
    # Table of previous orders would be nice here.
    #end

    active_admin_comments
	end
end