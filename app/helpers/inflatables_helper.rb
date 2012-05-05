module InflatablesHelper
  
  def inflatable_thumbnail(inflatable)
    r = ''
    r += "<div class='thumbnail'>"
	  r += image_tag(inflatable.primary_image.image_url(:thumb)) if inflatable.primary_image
	  r += "<h5>#{inflatable.name}</h5>"
	  r += "<p>Thumbnail caption right here...</p>"
	  r += "</div>"
	  return r
  end
  
end
