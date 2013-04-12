# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter	:set_current_user

	def set_current_user
		@current_user ||= login_from_session || login_from_cookie
	end

	def login_from_session
		begin
			@current_user = User.find(session[:user_id])

		rescue
			@current_user = nil;
			session[:user_id] = nil;
		end
	end

	def login_from_cookie
		begin
			if cookies[:client_crumbs]
				@current_user = User.find(cookies[:client_crumbs])
			end
		rescue
			@current_user = nil
			cookies[:client_crumbs] = nil
		end
	end

	def login_required 
		if @current_user.blank?
			flash[:notice] = "forbidden"
			redirect_to root_path
		end
	end

end
