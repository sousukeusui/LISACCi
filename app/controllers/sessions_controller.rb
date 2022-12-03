class SessionsController < ApplicationController
    def new
    end

		def create
			user = User.find_by(mail: params[:mail])
			if user
				p'成功'
			end
			if user && user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to tentative_users_after_new_path, notice: 'ログインしました'#工事一覧画面に遷移させるため後ほどpath変える
			else
				render action: :new
			end
		end

		def destroy
			reset_session
			redirect_to tentative_users_new_path, notice: 'ログアウトしました'
		end
end
