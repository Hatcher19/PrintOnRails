ActiveAdmin.register ArtStatus do
  controller.authorize_resource
  menu :label => "Art Status", :parent => "Settings", :if => proc{ can?(:destroy, Account) }
  index do
    column :id
  	column :name
  end
  show :title => :name do
    panel "Status Details" do
      attributes_table_for resource do
      	row :name
      end
    end
  end
end
