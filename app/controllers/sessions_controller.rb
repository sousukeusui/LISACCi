class SessionsController < ApplicationController
    def new
			@user = User.new
    end

		def create
			@user = User.find_by(mail: params[:mail])
			if @user && @user.authenticate(params[:password])
				session[:user_id] = @user.id
				redirect_to tentative_users_after_new_path ,notice: 'ログインしました'#工事一覧画面に遷移させるため後ほどpath変える
			else
				render action: :new
			end
		end

		private 
		def sessions_params
			params.require(:user).permit(:mail, :password, :password_confirmation)
		end
end
