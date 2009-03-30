require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/show.html.erb" do
  include MapsHelper
  before(:each) do
    assigns[:map] = @map = stub_model(Map,
      :name => "value for name",
      :permalink => "value for permalink",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ permalink/)
    response.should have_text(/value\ for\ description/)
  end
end

