class Spot < ActiveRecord::Base

  belongs_to :map
  has_permalink :name, :scope => :map_id
  
  def validate
    %w(spot map static index)
    # Watch for stopwords:
  end
  
  def to_param; self.permalink; end
  
  def flickr_photo_url
    return "http://www.flickr.com/photos/YOUR_FLICKR_USERNAME/PHOTO_ID/" if self.new_record?
    "http://www.flickr.com/photos/#{flickr_user}/#{flickr_photo_id}/"
  end
  
  def flickr_map_url
    return if self.new_record?
    "http://www.flickr.com/photos/#{flickr_user}/#{flickr_photo_id}/map/"
  end
    
end



# == Schema Information
# Schema version: 20090405055946
#
# Table name: spots
#
#  id                :integer(4)      not null, primary key
#  map_id            :integer(4)
#  name              :string(255)
#  permalink         :string(255)
#  description       :text
#  lat               :string(255)
#  long              :string(255)
#  flickr_photo_id   :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  flickr_user       :string(255)
#  flickr_square_url :string(255)
#

