class ApplicationController < ActionController::Base
	include SessionsHelper

	def authenticate_user
		if current_user == nil
			flash[:notice] = "ログインしてください"
			redirect_to "/login"
		end
	end

    def forbid_login_user
      if current_user
        flash[:notice] = "既にログインしています"
        redirect_to users_path
      end
    end
end
