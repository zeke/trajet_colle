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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Spot do
  before(:each) do
    @valid_attributes = {
      :map_id => 1,
      :name => "value for name",
      :permalink => "value for permalink",
      :description => "value for description",
      :lat => 1.5,
      :long => 1.5,
      :flickr_url => "value for flickr_url"
    }
  end

  it "should create a new instance given valid attributes" do
    Spot.create!(@valid_attributes)
  end
end
