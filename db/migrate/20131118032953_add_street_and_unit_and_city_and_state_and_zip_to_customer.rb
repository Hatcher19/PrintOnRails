class AddStreetAndUnitAndCityAndStateAndZipToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :street, :string
    add_column :customers, :unit, :string
    add_column :customers, :city, :string
    add_column :customers, :state, :string
    add_column :customers, :zip, :string
  end
end
