class AddProofToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :proof, :string
  end
end
