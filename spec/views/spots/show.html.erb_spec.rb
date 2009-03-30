require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/spots/show.html.erb" do
  include SpotsHelper
  before(:each) do
    assigns[:spot] = @spot = stub_model(Spot,
      :map_id => 1,
      :name => "value for name",
      :permalink => "value for permalink",
      :description => "value for description",
      :lat => 1.5,
      :long => 1.5,
      :flickr_url => "value for flickr_url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ permalink/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1\.5/)
    response.should have_text(/1\.5/)
    response.should have_text(/value\ for\ flickr_url/)
  end
end

