module MapsHelper
  
  def google_map(map)
    
    return content_tag(:p, "No spots on this map yet!", :class => "warning") if map.spots.blank?
    
    gm = GoogleMap.new
    map.spots.each do |spot|
      gm.markers << GoogleMapMarker.new(:map => gm, :lat => spot.lat, :lng => spot.long, :html => bubble_content(map, spot))
    end
    
    gm_div = content_tag(:div, gm.div, :class => "google_map")
    "#{gm.to_html} #{gm_div}"
  end

  def bubble_content(map, spot)
    out = []
    out << link_to(image_tag(spot.flickr_medium_url, :width => 200, :height => spot.height_for_width(200)), spot.flickr_photo_url, :target => "_blank")
    out << content_tag(:strong, spot.name)
    out << spot.description + " " + link_to("Edit this spot.", edit_map_spot_path(map, spot))
    content_tag(:div, out.join("<br/>"), :class => "bubble_content")
  end
  
  def map_thumbnail(map)
    if true
      i = (1..10).sort_by{rand}.first
      path = "sample_tiles/#{i}.png"
    else
    end
    link_to(image_tag(path, :class => "map_thumbnail"), map)
  end
  
end