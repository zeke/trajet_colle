require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/spots/new.html.erb" do
  include SpotsHelper
  
  before(:each) do
    assigns[:spot] = stub_model(Spot,
      :new_record? => true,
      :map_id => 1,
      :name => "value for name",
      :permalink => "value for permalink",
      :description => "value for description",
      :lat => 1.5,
      :long => 1.5,
      :flickr_url => "value for flickr_url"
    )
  end

  it "renders new spot form" do
    render
    
    response.should have_tag("form[action=?][method=post]", spots_path) do
      with_tag("input#spot_map_id[name=?]", "spot[map_id]")
      with_tag("input#spot_name[name=?]", "spot[name]")
      with_tag("input#spot_permalink[name=?]", "spot[permalink]")
      with_tag("textarea#spot_description[name=?]", "spot[description]")
      with_tag("input#spot_lat[name=?]", "spot[lat]")
      with_tag("input#spot_long[name=?]", "spot[long]")
      with_tag("input#spot_flickr_url[name=?]", "spot[flickr_url]")
    end
  end
end


