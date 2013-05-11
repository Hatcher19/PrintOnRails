ActiveAdmin.register AdminUser do
  menu :label => "Users", :parent => "Administration"

 	filter :first_name
 	filter :last_name
  filter :email
  filter :created_at

  index do
    column :first_name
    column :last_name
    column :email
    column :phone
    column :last_sign_in_at
    column :created_at
    default_actions
  end

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