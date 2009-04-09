module SpotsHelper

  def bad_url(url)
    page.replace_html 'flickr_errors', :partial => 'flickr_url_error', :locals => {:url => url}
  end

  def populate_form_with_flickr_photo_info(url, doc)
    
    # Collect metadata
    name = doc.search("h1").first.content.split("/").last rescue nil
    description = doc.search("meta[@name='description']").first['content'] rescue nil
    location = doc.search("meta[@name='ICBM']").first['content'] rescue nil
    lat = location.split(", ").first rescue nil
    long = location.split(", ").last rescue nil
    flickr_photo_id = url.scan(/photos\/\w*\/(\d+)/).first.first rescue nil
    flickr_user = url.scan(/photos\/(\w*)/).first.first rescue nil
    
    # Stop here if not geotagged
    if lat.blank? || long.blank?
      page.replace_html 'flickr_errors', :partial => 'flickr_geotag_error', :locals => {:url => url}
      return
    else
      page.hide 'flickr_errors'
    end
    
    # Get size info
    sizes = flickr.photos.getSizes(:photo_id => flickr_photo_id)
    flickr_square_url = sizes.find {|s| s.label == 'Square' }.source
    flickr_medium_url = sizes.find {|s| s.label == 'Medium' }.source
    width = sizes.find {|s| s.label == 'Original' }.width
    height = sizes.find {|s| s.label == 'Original' }.height
    
    # Get location info
    info = flickr.photos.getInfo(:photo_id => flickr_photo_id)
    country = info.location.country._content rescue nil
    region = info.location.region._content rescue nil
    county = info.location.county._content rescue nil
    locality = info.location.locality._content rescue nil
    neighbourhood = info.location.neighbourhood._content rescue nil
    
    # Update inputs
    inputs = %w(name lat long flickr_photo_id flickr_user flickr_square_url flickr_medium_url width height)
    inputs << %w(country region county location neighbourhood)
    inputs.flatten.each do |input|
      page.call 'update_input', "spot_#{input}", eval(input)
    end
    
    %w(description).each do |input|
      page.call 'update_textarea', "spot_#{input}", eval(input)
    end
    
    page.show('form')

    # page.replace_html 'metadata', :partial => 'spot_metadata'
  end

  def spot_thumbnail(spot, options={})
    options[:size] ||= 40
    image_tag(spot.flickr_square_url, :width => options[:size], :height => options[:size], :class => "thumb")
  end
  
end
