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
