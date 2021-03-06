ActiveAdmin.register OrderType do
controller.authorize_resource
menu :label => "Order Type", :parent => "Settings", :if => proc{ can?(:destroy, Account) }, :priority => 5
  index do
    column :id
    column :name
  end

  show :title => :name do
    panel "Order Type Details" do
      attributes_table_for resource do
      row :name
      end
    end
  end
end