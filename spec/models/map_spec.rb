require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Map do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :permalink => "value for permalink",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Map.create!(@valid_attributes)
  end
end
