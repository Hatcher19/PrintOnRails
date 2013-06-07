ActiveAdmin.register Address do
  belongs_to :customer, finder: :find_by_url!
  actions :index, :new, :create, :show

  show :title => :name do
    
    panel "address Details" do
      attributes_table_for resource do
        row :address_type
        row :address_name
        row :street
        row :city
        row :state
        row :zip
        row :same_as_billing
      end
    end
  end
end
