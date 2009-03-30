require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpotsController do

  def mock_spot(stubs={})
    @mock_spot ||= mock_model(Spot, stubs)
  end
  
  describe "GET index" do

    it "exposes all spots as @spots" do
      Spot.should_receive(:find).with(:all).and_return([mock_spot])
      get :index
      assigns[:spots].should == [mock_spot]
    end

    describe "with mime type of xml" do
  
      it "renders all spots as xml" do
        Spot.should_receive(:find).with(:all).and_return(spots = mock("Array of Spots"))
        spots.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested spot as @spot" do
      Spot.should_receive(:find).with("37").and_return(mock_spot)
      get :show, :id => "37"
      assigns[:spot].should equal(mock_spot)
    end
    
    describe "with mime type of xml" do

      it "renders the requested spot as xml" do
        Spot.should_receive(:find).with("37").and_return(mock_spot)
        mock_spot.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new spot as @spot" do
      Spot.should_receive(:new).and_return(mock_spot)
      get :new
      assigns[:spot].should equal(mock_spot)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested spot as @spot" do
      Spot.should_receive(:find).with("37").and_return(mock_spot)
      get :edit, :id => "37"
      assigns[:spot].should equal(mock_spot)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created spot as @spot" do
        Spot.should_receive(:new).with({'these' => 'params'}).and_return(mock_spot(:save => true))
        post :create, :spot => {:these => 'params'}
        assigns(:spot).should equal(mock_spot)
      end

      it "redirects to the created spot" do
        Spot.stub!(:new).and_return(mock_spot(:save => true))
        post :create, :spot => {}
        response.should redirect_to(spot_url(mock_spot))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved spot as @spot" do
        Spot.stub!(:new).with({'these' => 'params'}).and_return(mock_spot(:save => false))
        post :create, :spot => {:these => 'params'}
        assigns(:spot).should equal(mock_spot)
      end

      it "re-renders the 'new' template" do
        Spot.stub!(:new).and_return(mock_spot(:save => false))
        post :create, :spot => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested spot" do
        Spot.should_receive(:find).with("37").and_return(mock_spot)
        mock_spot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :spot => {:these => 'params'}
      end

      it "exposes the requested spot as @spot" do
        Spot.stub!(:find).and_return(mock_spot(:update_attributes => true))
        put :update, :id => "1"
        assigns(:spot).should equal(mock_spot)
      end

      it "redirects to the spot" do
        Spot.stub!(:find).and_return(mock_spot(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(spot_url(mock_spot))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested spot" do
        Spot.should_receive(:find).with("37").and_return(mock_spot)
        mock_spot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :spot => {:these => 'params'}
      end

      it "exposes the spot as @spot" do
        Spot.stub!(:find).and_return(mock_spot(:update_attributes => false))
        put :update, :id => "1"
        assigns(:spot).should equal(mock_spot)
      end

      it "re-renders the 'edit' template" do
        Spot.stub!(:find).and_return(mock_spot(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested spot" do
      Spot.should_receive(:find).with("37").and_return(mock_spot)
      mock_spot.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the spots list" do
      Spot.stub!(:find).and_return(mock_spot(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(spots_url)
    end

  end

end
