class ApplicationController < ActionController::API
  include Knock::Authenticable
	include SessionsHelper
end
