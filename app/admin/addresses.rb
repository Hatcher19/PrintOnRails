ActiveAdmin.register Address do
  belongs_to :customer, finder: :find_by_url!
  actions :index, :new, :create, :show

  index do 
    column :street
    column :city
    column :state
    column :zip
  end

  show :title => :name do
    
    panel "address Details" do
      attributes_table_for resource do
        row :street
        row :city
        row :state
        row :zip
      end
    end
  end
end