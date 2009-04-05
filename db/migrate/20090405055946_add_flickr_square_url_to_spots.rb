class AddFlickrSquareUrlToSpots < ActiveRecord::Migration
  def self.up
    add_column :spots, :flickr_square_url, :string
  end

  def self.down
    remove_column :spots, :flickr_square_url
  end
end
