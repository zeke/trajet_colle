class AddEvenMoreFieldsToSpot < ActiveRecord::Migration
  def self.up
    add_column :spots, :country, :string
    add_column :spots, :region, :string
    add_column :spots, :county, :string
    add_column :spots, :locality, :string
    add_column :spots, :neighbourhood, :string
  end

  def self.down
    drop_column :spots, :country
    drop_column :spots, :region
    drop_column :spots, :county
    drop_column :spots, :locality
    drop_column :spots, :neighbourhood
  end
end
