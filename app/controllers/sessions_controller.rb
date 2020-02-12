class SessionsController < ApplicationController
	before_action :forbid_login_user, {only: [:new, :create]}
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
  		flash[:notice] = "ログイン成功"
  		redirect_to "/users"
  	else
  		flash.now[:notice] = "間違いです"
  		render :new
  	end
  end

  def destroy
  	log_out
  	redirect_to("/")
  end
end
