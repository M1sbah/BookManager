class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	include Pundit::Authorization

	protect_from_forgery with: :exception
	rescue_from Pundit::NotAuthorizedError do |exception|
		flash[:alert] = "You don't have right access to access this page!"
		redirect_to (request.referrer || root_path)
	end

end
