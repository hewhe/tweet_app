class ApplicationController < ActionController::Base
	include SessionsHelper

	def authenticate_user
		if current_user == nil
			flash[:notice] = "ログインしてください"
			redirect_to "/login"
		end
	end
end
