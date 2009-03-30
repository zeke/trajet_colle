require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpotsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "spots", :action => "index").should == "/spots"
    end
  
    it "maps #new" do
      route_for(:controller => "spots", :action => "new").should == "/spots/new"
    end
  
    it "maps #show" do
      route_for(:controller => "spots", :action => "show", :id => "1").should == "/spots/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "spots", :action => "edit", :id => "1").should == "/spots/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "spots", :action => "create").should == {:path => "/spots", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "spots", :action => "update", :id => "1").should == {:path =>"/spots/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "spots", :action => "destroy", :id => "1").should == {:path =>"/spots/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/spots").should == {:controller => "spots", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/spots/new").should == {:controller => "spots", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/spots").should == {:controller => "spots", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/spots/1").should == {:controller => "spots", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/spots/1/edit").should == {:controller => "spots", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/spots/1").should == {:controller => "spots", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/spots/1").should == {:controller => "spots", :action => "destroy", :id => "1"}
    end
  end
end
