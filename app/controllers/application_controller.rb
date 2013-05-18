class ApplicationController < ActionController::Base
	http_basic_authenticate_with :name => "2", :password => "3"
  protect_from_forgery
end
