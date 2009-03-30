require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/new.html.erb" do
  include MapsHelper
  
  before(:each) do
    assigns[:map] = stub_model(Map,
      :new_record? => true,
      :name => "value for name",
      :permalink => "value for permalink",
      :description => "value for description"
    )
  end

  it "renders new map form" do
    render
    
    response.should have_tag("form[action=?][method=post]", maps_path) do
      with_tag("input#map_name[name=?]", "map[name]")
      with_tag("input#map_permalink[name=?]", "map[permalink]")
      with_tag("textarea#map_description[name=?]", "map[description]")
    end
  end
end


