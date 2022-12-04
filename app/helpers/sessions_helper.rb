module SessionsHelper
	#ログインしているユーザーを取得
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		elsif session[:google_id]
			@current_user ||= GoogleUser.find_by(id: session[:google_id])
		end
	end

	#渡されたuserとログインしているユーザーが一致すればtrueを返す
	def current_user?(user)
		user == current_user
	end

	#ログインしていればtureを返す
	def logged_in
		current_user.present?
	end
end
