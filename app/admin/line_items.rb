ActiveAdmin.register LineItem do
	belongs_to :order
	controller do
	actions :all, :except => [:destroy]
  end
end
