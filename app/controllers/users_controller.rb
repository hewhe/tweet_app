class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by(id: params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_nparams)
  	if @user.save
  		flash[:notice] = "登録！！"
  		redirect_to users_path
  	else
  		render :new
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_nparams)
  		flash[:notice] = "成功！！！"
  		redirect_to users_path
  	else
  		render("/users/edit")
  	end
  end

	private

		def user_nparams
			params.permit(:name, :email)
		end

		def user_params
			params.require(:user).permit(:name, :email)
		end
end
