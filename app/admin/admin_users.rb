ActiveAdmin.register AdminUser do
  scope_to :account
  controller.authorize_resource
  menu :label => "Users", :parent => "Settings", :if => proc{ can?(:create, AdminUser) }, :priority => 6

 	filter :first
  filter :last
  filter :email
  filter :created_at 
  filter :role, as: :select, :collection => AdminUser::ROLES

  controller do
    def account
      current_admin_user.account
    end
  end


  index do
    column :first
    column :last
    column :phone
    column :email, :sortable => :email do |admin_user| link_to admin_user.email, "mailto:#{admin_user.email}" end
    column :role do |admin_user| admin_user.role.humanize end
    default_actions
  end

  form :partial => "form"

  show do
    panel "Order History" do
      table_for(admin_user.orders) do
        column("ID", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
        column("Order Name", :sortable => :name) {|order| "#{order.name}" }
        column("Due Date", :sortable => :end_date) {|order| "#{order.end_date}" }
      end
    end
  end

  sidebar :User_info, only: :show do
    attributes_table_for resource do
      row :first
      row :last
      row :email
      row :phone
      row :role do |admin_user| admin_user.role.humanize end
    end
  end

  sidebar :login_stats, only: :show do
    attributes_table_for resource do
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at 
      row :updated_at 
    end   
  end
end