require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MapsController do

  def mock_map(stubs={})
    @mock_map ||= mock_model(Map, stubs)
  end
  
  describe "GET index" do

    it "exposes all maps as @maps" do
      Map.should_receive(:find).with(:all).and_return([mock_map])
      get :index
      assigns[:maps].should == [mock_map]
    end

    describe "with mime type of xml" do
  
      it "renders all maps as xml" do
        Map.should_receive(:find).with(:all).and_return(maps = mock("Array of Maps"))
        maps.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested map as @map" do
      Map.should_receive(:find).with("37").and_return(mock_map)
      get :show, :id => "37"
      assigns[:map].should equal(mock_map)
    end
    
    describe "with mime type of xml" do

      it "renders the requested map as xml" do
        Map.should_receive(:find).with("37").and_return(mock_map)
        mock_map.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new map as @map" do
      Map.should_receive(:new).and_return(mock_map)
      get :new
      assigns[:map].should equal(mock_map)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested map as @map" do
      Map.should_receive(:find).with("37").and_return(mock_map)
      get :edit, :id => "37"
      assigns[:map].should equal(mock_map)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created map as @map" do
        Map.should_receive(:new).with({'these' => 'params'}).and_return(mock_map(:save => true))
        post :create, :map => {:these => 'params'}
        assigns(:map).should equal(mock_map)
      end

      it "redirects to the created map" do
        Map.stub!(:new).and_return(mock_map(:save => true))
        post :create, :map => {}
        response.should redirect_to(map_url(mock_map))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved map as @map" do
        Map.stub!(:new).with({'these' => 'params'}).and_return(mock_map(:save => false))
        post :create, :map => {:these => 'params'}
        assigns(:map).should equal(mock_map)
      end

      it "re-renders the 'new' template" do
        Map.stub!(:new).and_return(mock_map(:save => false))
        post :create, :map => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested map" do
        Map.should_receive(:find).with("37").and_return(mock_map)
        mock_map.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :map => {:these => 'params'}
      end

      it "exposes the requested map as @map" do
        Map.stub!(:find).and_return(mock_map(:update_attributes => true))
        put :update, :id => "1"
        assigns(:map).should equal(mock_map)
      end

      it "redirects to the map" do
        Map.stub!(:find).and_return(mock_map(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(map_url(mock_map))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested map" do
        Map.should_receive(:find).with("37").and_return(mock_map)
        mock_map.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :map => {:these => 'params'}
      end

      it "exposes the map as @map" do
        Map.stub!(:find).and_return(mock_map(:update_attributes => false))
        put :update, :id => "1"
        assigns(:map).should equal(mock_map)
      end

      it "re-renders the 'edit' template" do
        Map.stub!(:find).and_return(mock_map(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested map" do
      Map.should_receive(:find).with("37").and_return(mock_map)
      mock_map.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the maps list" do
      Map.stub!(:find).and_return(mock_map(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(maps_url)
    end

  end

end
