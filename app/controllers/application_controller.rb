class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :basket

def basket
	
	if session[:basket].nil?
		session[:basket] = Set.new
	end

	session[:basket]

end

end
