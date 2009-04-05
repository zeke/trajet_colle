class Map < ActiveRecord::Base

  has_many :spots
  
  has_permalink :name

  def validate
    # Watch for stopwords: maps, map, spots, spot
  end
  
  def to_param; self.permalink; end

end

# == Schema Information
# Schema version: 20090330052400
#
# Table name: maps
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  permalink   :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

