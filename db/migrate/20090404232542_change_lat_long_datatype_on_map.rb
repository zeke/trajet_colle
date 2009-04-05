class ChangeLatLongDatatypeOnMap < ActiveRecord::Migration
  def self.up
    change_column :spots, :lat, :string
    change_column :spots, :long, :string
  end

  def self.down
    change_column :spots, :lat, :float
    change_column :spots, :long, :float
  end
end
