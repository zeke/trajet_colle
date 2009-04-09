module SpotsHelper

  def populate_form_with_flickr_photo_info(url, doc)
    name = doc.search("h1").first.content.split("/").last rescue nil
    description = doc.search("meta[@name='description']").first['content'] rescue nil
    location = doc.search("meta[@name='ICBM']").first['content'] rescue nil
    lat = location.split(", ").first rescue nil
    long = location.split(", ").last rescue nil
    flickr_photo_id = url.scan(/photos\/\w*\/(\d+)/).first.first rescue nil
    flickr_user = url.scan(/photos\/(\w*)/).first.first rescue nil
    
    if lat.blank? || long.blank?
      page.call('alert', "This flickr photo doesn't appear to be geotagged.") and return
    end
    
    sizes = flickr.photos.getSizes(:photo_id => flickr_photo_id)
    
    flickr_square_url = sizes.find {|s| s.label == 'Square' }.source
    flickr_medium_url = sizes.find {|s| s.label == 'Medium' }.source
    width = sizes.find {|s| s.label == 'Original' }.width
    height = sizes.find {|s| s.label == 'Original' }.height
    
    %w(name lat long flickr_photo_id flickr_user flickr_square_url flickr_medium_url width height).each do |input|
      page.call 'update_input', "spot_#{input}", eval(input)
    end
    
    %w(description).each do |input|
      page.call 'update_textarea', "spot_#{input}", eval(input)
    end
        
    page.replace_html 'metadata', :partial => 'spot_metadata'

  end

  def spot_thumbnail(spot, options={})
    options[:size] ||= 40
    image_tag(spot.flickr_square_url, :width => options[:size], :height => options[:size], :class => "thumb")
  end
  
end
