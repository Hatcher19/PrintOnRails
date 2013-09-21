ActiveAdmin.register AdminUser do
  controller.authorize_resource
  menu :label => "Users", :parent => "Administration", :if => proc{ can?(:create, AdminUser) }, :priority => 6

 	filter :full_name
  filter :email
  filter :created_at 
  filter :role, as: :select, :collection => AdminUser::ROLES


  index do
    selectable_column
    column :full_name
    column :email, :sortable => :email do |admin_user|
      link_to admin_user.email, "mailto:#{admin_user.email}"
    end
    column :phone
    column :role
    default_actions
  end

  form :partial => "form"

  sidebar :login_info, only: [:show, :edit] do
    attributes_table_for resource do
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at 
    end   
  end
end