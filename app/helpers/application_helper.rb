module ApplicationHelper

  def page_title
    o = ["trajet collé"]
    o << request.path.split("/").remove_first_element
    o.join(" / ")
  end

 def page_header
   # raise request.path.split("/").remove_first_element.to_yaml
   o = [link_to("trajet collé", root_path)]
   if params[:controller] == "maps"
     o << link_to("maps", root_path) 
   end
   o << link_to(@map.permalink, @map) if @map
   o << link_to("spots", root_path) if params[:controller] == "spots"
   o << "new" if params[:action] == "new"
   o.join(" / ")
 end
 
 def flash_messages 
   flash.keys.map { |key| content_tag( :div, flash[key], :class => "flash_message #{key}" ) if flash[key] }.join
 end

end
