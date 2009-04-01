module ApplicationHelper

 def page_title
   o = ["trajet collé"]
   o << "maps" if params[:controller] == "maps"
   o << "spots" if params[:controller] == "spots"
   o.join(" / ")
 end

end
