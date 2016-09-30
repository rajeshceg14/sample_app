module ApplicationHelper
  def full_title(page_title)
  	base_title = "Photo App : "
  	if page_title.empty?
  		base_title
  	else
  		base_title.to_s + page_title.to_s
    end
  end


  def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end

  def is_signin_page?(params)
    params[:action] == "new" && params[:controller] == "sessions"
  end

end
