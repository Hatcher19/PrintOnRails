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
    column :name do |admin_user| link_to "#{admin_user.first} #{admin_user.last}", admin_admin_user_path(admin_user) end
    column :phone_number
    column :email, :sortable => :email do |admin_user| link_to admin_user.email, "mailto:#{admin_user.email}" end
    column :role do |admin_user| admin_user.role.titleize end
  end

  form :partial => "form"

  show :title => :email do
    panel "Order History" do
      table_for(admin_user.orders) do
        column("ID", :sortable => :guid) {|order| link_to "##{order.guid}", admin_order_path(order) }
        column("Order Name", :sortable => :name) {|order| "#{order.name}" }
        column("Due Date") do |obj|
          obj.end_date.strftime("%m/%d/%y")
        end
        column("Status") {|order| "#{order.order_status.name}" }
      end
    end
  end

  sidebar :User_info, only: :show do
    attributes_table_for resource do
      row :first
      row :last
      row :email
      row :phone_number
      row :role do |admin_user| admin_user.role.humanize end
    end
  end

  sidebar :login_stats, only: :show do
    attributes_table_for resource do
      row :sign_in_count
      row :created_at do |obj|
        obj.created_at.strftime("%b %d, %Y")
      end
    end   
  end
  sidebar "Help/ Feedback" do
    h4 "For all questions and/or feedback please email us."
    h1 mail_to "info@printonrails.com", raw(image_tag("email_us.png"))
  end
end