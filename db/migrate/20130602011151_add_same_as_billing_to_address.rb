class AddSameAsBillingToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :same_as_billing, :boolean
  end
end
