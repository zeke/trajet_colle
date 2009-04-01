class Spot < ActiveRecord::Base

  belongs_to :map
  has_permalink :name, :scope => :map
  
  def validate
    # Watch for stopwords
  end
  
end

# == Schema Information
# Schema version: 20090330052400
#
# Table name: spots
#
#  id          :integer(4)      not null, primary key
#  map_id      :integer(4)
#  name        :string(255)
#  permalink   :string(255)
#  description :text
#  lat         :float
#  long        :float
#  flickr_url  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

