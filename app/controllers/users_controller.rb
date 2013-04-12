# encoding: UTF-8
class UsersController < ApplicationController
	before_filter :login_required, :except => [:new, :create, :login, :signin]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save 
			redirect_to root_path
		else
			render :action => :new 
		end
	end

	def show 
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		if @user.update_attributes(params[:user])
			redirect_to root_path, notice:'User was successfully updated.'
		else
			render :action => "edit"
		end
	end

	def signin
		if user = User.authenticate(params[:user][:login], params[:user][:password])
			@current_user = user
			session[:user_id] = user.id
			redirect_to root_path
		else
			@current_user = nil;
			session[:user_id] = nil;
			reset_session

			flash[:notice] = "Check your ID and Password."
			redirect_to login_path
		end 
	end

	def logout
		@current_user = nil
		session[:user_id] = nil
		redirect_to root_path
	end
end
