class RemoveStripeCustomerTokenFromAccount < ActiveRecord::Migration
  def up
    remove_column :accounts, :stripe_customer_token
  end

  def down
    add_column :accounts, :stripe_customer_token, :string
  end
end
