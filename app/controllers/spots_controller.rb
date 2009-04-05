class SpotsController < ApplicationController
  
  before_filter :load_map

  def index
    @spots = Spot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spots }
    end
  end
  
  def fetch_flickr_photo_info
    url = params[:url]
    doc = Nokogiri::HTML(open(url))
    render(:update) { |page| page.populate_form_with_flickr_photo_info(url, doc) }
  end

  def show
    @spot = Spot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spot }
    end
  end
  
  def new
    @spot = Spot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spot }
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end
  
  def create
    @spot = @map.spots.new(params[:spot])

    respond_to do |format|
      if @spot.save
        flash[:notice] = 'Spot was successfully created.'
        format.html { redirect_to(@map) }
        format.xml  { render :xml => @spot, :status => :created, :location => @spot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spot.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @spot = Spot.find(params[:id])

    respond_to do |format|
      if @spot.update_attributes(params[:spot])
        flash[:notice] = 'Spot was successfully updated.'
        format.html { redirect_to(@spot) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spot.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to(spots_url) }
      format.xml  { head :ok }
    end
  end
  
protected
  
  def load_map
    @map = Map.find_by_permalink(params[:map_id])
  end
end
