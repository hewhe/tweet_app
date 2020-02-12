class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :correct_user, {only: [:edit, :update]}
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
    @user.image_name = "d_image.jpg"
  	if @user.save
      log_in(@user)
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

    if image = params[:image]
      @user.image_name = "#{@user.id}.jpg" #jpgにしてる
      File.binwrite("public/#{@user.image_name}", image.read)
    end

  	if @user.update(user_nparams)
  		flash[:notice] = "成功！！！"
  		redirect_to users_path
  	else
  		render("/users/edit")
  	end
  end

	private

		def user_nparams
			params.permit(:name, :email, :image_name, :password, :password_confirmation)
		end

		def user_params
			params.require(:user).permit(:name, :email)
		end

    def correct_user
       # if current_user.id != params[:id].to_i これはできない
       #   flash[:notice] = "権限なし"
       #   redirect_to "/users/index"
       # end
       user = User.find(params[:id])
       if @current_user.id != user.id
         flash[:notice] = "権限なし"
         redirect_to users_path
       end
    end
end
