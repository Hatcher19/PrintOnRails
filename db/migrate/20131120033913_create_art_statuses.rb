class CreateArtStatuses < ActiveRecord::Migration
  def change
    create_table :art_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
