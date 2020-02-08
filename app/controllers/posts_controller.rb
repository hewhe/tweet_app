class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_nparams)
  	if @post.save
  		flash[:notice] = "成功！！"
  		redirect_to("/posts")
  	else
  		render("posts/new")
  	end

  	# form_for用のcreate
  	# @post = Post.new(post_params)
  	# @post.save
  	# redirect_to("/post/index")
  end

  def edit
	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find_by(id: params[:id])
  	if @post.update(post_nparams)
  		flash[:notice] = "成功！"
  		redirect_to("/posts/#{@post.id}")
  	else
  		render :edit
  	end
  end

  def destroy
	@post = Post.find(params[:id])
	@post.destroy
	flash[:notice] = "削除！！"
	redirect_to posts_path
  end

  private
  	def post_nparams
  		params.permit(:title, :content)
  	end

  	#form_for用paramsのネスト
  	def post_params
  		params.require(:post).permit(:title, :content)
  	end

end
