module ApplicationHelper
   def full_title(page_title)
	base_title = "Photo App : "
	if page_title.empty?
		base_title
	else
		"#{base_title}" | "#{page_title}"
   	end
   end


   def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
   end

end
