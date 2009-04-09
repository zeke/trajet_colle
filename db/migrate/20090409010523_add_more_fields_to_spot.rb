class AddMoreFieldsToSpot < ActiveRecord::Migration
  def self.up
    add_column :spots, :flickr_medium_url, :string
    add_column :spots, :width, :integer
    add_column :spots, :height, :integer
  end

  def self.down
    remove_column :spots, :flickr_medium_url
    remove_column :spots, :width
    remove_column :spots, :height
  end
end
