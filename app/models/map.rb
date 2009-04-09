class Map < ActiveRecord::Base

  validates_uniqueness_of :name
  validates_format_of :name, :with => /^\w+$/i, :message => "can only contain letters and numbers."

  has_permalink :name

  has_many :spots, :order => "spots.created_at DESC", :dependent => :destroy

  def validate
    stop_words = %w(spot map static index)
    if stop_words.include?(self.name.downcase)
      errors.add_to_base "Sorry, you can't name your map '#{self.name}'. That word is reserved by the dictatorial regime."
    end
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

