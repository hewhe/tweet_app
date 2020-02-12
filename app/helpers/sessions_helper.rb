module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def set_current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def log_out
	  	session.delete(:user_id)
	  	@current_user = nil
	end

	def logged_in?
		!set_current_user.nil?
	end
end