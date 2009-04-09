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
   o << link_to(@map.permalink, @map) if @map && !@map.new_record?
   o << link_to("spots", root_path) if params[:controller] == "spots"
   o << "new" if params[:action] == "new"
   if params[:controller] == "static"
     o << "how" if params[:action] == "how"
   end
   o.join(" / ")
 end
 
 def main_nav
   items = []
   items << link_to("index", root_path)
   items << link_to("maps", maps_path)
   items << link_to("create your own", "static/how")
   convert_to_list_items(items)
 end
 
 def convert_to_list_items(items)
   output = ""
   items.each_with_index do |item, index|
     css = []
     css << "first" if index == 0
     css << "last" if index == items.size-1
     output << content_tag(:li, item, :class => css.join(" "))
   end
   output
 end
 
 def info_pair(label, value)
   return nil if value.blank?
   label = content_tag(:span, "#{label}:").to_s
   label = "thig"
   value = "thog"
   content_tag(:span, [label, value].join(" "), :class => "info_pair")
 end
 
 def flash_messages 
   flash.keys.map { |key| content_tag( :div, flash[key], :class => "flash_message #{key}" ) if flash[key] }.join
 end

end
