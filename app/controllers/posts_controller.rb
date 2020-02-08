class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(created_at: :desc)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_nparams)
  	@post.save
  	redirect_to("/posts")

  	# form_for用のcreate
  	# @post = Post.new(post_params)
  	# @post.save
  	# redirect_to("/post/index")
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
