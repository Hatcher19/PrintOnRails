ActiveAdmin.register OrderStatus do
  controller.authorize_resource
  menu :label => "Order Status", :parent => "Administration", :if => proc{ can?(:destroy, OrderStatus) }, :priority => 4

  index do
  	column :name
    column 'Open Status', :sortable => :active do |status|
      status_tag status.active? ? "Active" : "Closed", status.active? ? :green : :red
    end
  	default_actions
  end

  show :title => :name do
    
    panel "Status Details" do
      attributes_table_for resource do
      	row :name
      	row 'Open Status' do |status|
          status_tag status.active? ? "Active" : "Closed", status.active? ? :green : :red
        end
      end
    end
  end
end
