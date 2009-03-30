class CreateSpots < ActiveRecord::Migration
  def self.up
    create_table :spots do |t|
      t.integer :map_id
      t.string :name
      t.string :permalink
      t.text :description
      t.float :lat
      t.float :long
      t.string :flickr_url

      t.timestamps
    end
  end

  def self.down
    drop_table :spots
  end
end
