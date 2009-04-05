class ChangeFlickrFieldsOnSpot < ActiveRecord::Migration
  def self.up
    rename_column :spots, :flickr_url, :flickr_photo_id
    add_column :spots, :flickr_user, :string
  end

  def self.down
    rename_column :spots, :flickr_photo_id, :flickr_url
    remove_column :spots, :flickr_user
  end
end
