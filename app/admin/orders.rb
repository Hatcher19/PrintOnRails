ActiveAdmin.register Order do

	filter :name, label: "Order Name"
  filter :start_date, label: "Start Date"
  filter :end_date, label: "Due Date"

	index do
    column :name
    column :end_date
  end
end