class ApplicationController < ActionController::Base

  before_filter :set_cache_headers
  protect_from_forgery
  include SessionsHelper

  def handle_unverified_request
    sign_out
    super
  end

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
end
