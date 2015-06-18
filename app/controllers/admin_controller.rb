class AdminController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :authenticate_admin!

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to admin_root_url, :alert => exception.message
	end

	def per_page
		params[:per_page] || 10
	end

	def current_ability
		@current_ability ||= Ability.new(current_admin)
	end
end