module MapsHelper
  
  def google_map(map)
    
    return content_tag(:p, "No spots on this map yet!", :class => "warning") if map.spots.blank?
    
    gm = GoogleMap.new
    map.spots.each do |spot|
      gm.markers << GoogleMapMarker.new(:map => gm, :lat => spot.lat, :lng => spot.long, :html => spot.name)
    end
    
    gm_div = content_tag(:div, gm.div, :class => "google_map")
    "#{gm.to_html} #{gm_div}"
  end
  
end