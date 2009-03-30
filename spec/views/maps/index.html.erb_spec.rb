require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/index.html.erb" do
  include MapsHelper
  
  before(:each) do
    assigns[:maps] = [
      stub_model(Map,
        :name => "value for name",
        :permalink => "value for permalink",
        :description => "value for description"
      ),
      stub_model(Map,
        :name => "value for name",
        :permalink => "value for permalink",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of maps" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for permalink".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

