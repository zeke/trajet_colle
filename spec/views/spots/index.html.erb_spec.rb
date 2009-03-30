require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/spots/index.html.erb" do
  include SpotsHelper
  
  before(:each) do
    assigns[:spots] = [
      stub_model(Spot,
        :map_id => 1,
        :name => "value for name",
        :permalink => "value for permalink",
        :description => "value for description",
        :lat => 1.5,
        :long => 1.5,
        :flickr_url => "value for flickr_url"
      ),
      stub_model(Spot,
        :map_id => 1,
        :name => "value for name",
        :permalink => "value for permalink",
        :description => "value for description",
        :lat => 1.5,
        :long => 1.5,
        :flickr_url => "value for flickr_url"
      )
    ]
  end

  it "renders a list of spots" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for permalink".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
    response.should have_tag("tr>td", "value for flickr_url".to_s, 2)
  end
end

