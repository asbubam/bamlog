class MainController < ApplicationController

	def index
		@posts = Post.order("id desc").page params[:page]
	end

end
