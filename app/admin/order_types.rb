ActiveAdmin.register OrderType do
controller.authorize_resource
menu :label => "Order Type", :parent => "Administration", :if => proc{ can?(:destroy, OrderType) }, :priority => 5
  index do
    column :name
    default_actions
  end

  show :title => :name do
    panel "Order Type Details" do
      attributes_table_for resource do
      row :name
      row :description
      end
    end
  end
end