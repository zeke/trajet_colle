require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/maps/edit.html.erb" do
  include MapsHelper
  
  before(:each) do
    assigns[:map] = @map = stub_model(Map,
      :new_record? => false,
      :name => "value for name",
      :permalink => "value for permalink",
      :description => "value for description"
    )
  end

  it "renders the edit map form" do
    render
    
    response.should have_tag("form[action=#{map_path(@map)}][method=post]") do
      with_tag('input#map_name[name=?]', "map[name]")
      with_tag('input#map_permalink[name=?]', "map[permalink]")
      with_tag('textarea#map_description[name=?]', "map[description]")
    end
  end
end


