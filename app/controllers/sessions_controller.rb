class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(mail: session_params[:mail])
		if user && user.authenticate(session_params[:password])
			session[:user_id] = user.id
			redirect_to sites_index_path, notice: 'ログインしました'#工事一覧画面に遷移させるため後ほどpath変える
		else
			render action: :new
		end
	end

	def destroy
		reset_session
		redirect_to root_path, notice: 'ログアウトしました'
	end

	private
	def session_params
		params.require(:session).permit(:mail, :password)
	end
end
