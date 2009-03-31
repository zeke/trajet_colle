class Map < ActiveRecord::Base

  has_many :spots

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

