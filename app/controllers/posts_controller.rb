class PostsController < ApplicationController

	before_filter :login_required, :except => [:show, :download, :download2]
	before_filter :user_check, :only => [:edit, :update, :destroy]

	def show
		@post = Post.find(params[:id])
		@post.hit
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].merge(:user_id => @current_user.id))

		if @post.save
			redirect_to @post
		else
			render :action => :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to post_path(@post), notice: 'Post was successfully updated.'
		else
			render :action => "edit"
		end
	end
	
	def destroy
		@post = Post.find(params[:id])

		if @post.destroy 
			redirect_to root_path
		else
			flash[:message] = "Failed."
		end
	end

  def download
    post = Post.find(params[:id])

    _type = MIME::Types.type_for(post.asset_file_name)

    _filename = if /msie/i.match(request.env['HTTP_USER_AGENT'])
      URI.encode(post.asset_file_name)
    else
        post.asset_file_name
    end

    @full_filename = post.asset.path
    send_file @full_filename, :filename => _filename, :type => _type
  end

  def download2
    post = Post.find(params[:id])

    _type = MIME::Types.type_for(post.asset2_file_name)

    _filename = if /msie/i.match(request.env['HTTP_USER_AGENT'])
      URI.encode(post.asset2_file_name)
    else
        post.asset2_file_name
    end

    @full_filename = post.asset.path
    send_file @full_filename, :filename => _filename, :type => _type
  end

private 
	def user_check
		@post = Post.find(params[:id])	

		if @current_user != @post.user
			flash[:notice] = "permission denied"
			redirect_to root_path
		end
	end
end
