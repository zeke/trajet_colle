class Spot < ActiveRecord::Base

  validates_presence_of :name, :lat, :long
  validates_format_of :name, :with => /^\w+$/i, :message => "can only contain letters and numbers."
  validates_numericality_of :lat, :long # Maybe this will buy some relief from robots?
  validates_uniqueness_of :name, :scope => :map_id

  has_permalink :name, :scope => :map_id
  
  belongs_to :map
  
  def validate
    stop_words = %w(spot map static index)
    if stop_words.include?(self.name.downcase)
      errors.add_to_base "Sorry, you can't name your spot '#{self.name}'. That word is reserved by the dictatorial regime."
    end
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
  
  def height_for_width(w)
    ratio = w.to_f / width.to_f
    (height.to_f * ratio).to_i
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

