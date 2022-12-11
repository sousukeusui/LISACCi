class TentativeUsersController < ApplicationController
	def new
		@tentative_user = TentativeUser.new
	end

	def create
		#仮ユーザー作る
		@tentative_user = TentativeUser.new(tentative_user_params)
		#期限時間の登録
		@tentative_user.expired_at = Time.zone.now + 1.days

		if @tentative_user.save
				#メールを送る処理を書く
			UserMailer.registration_mail(@tentative_user).deliver_later
			redirect_to "/tentative_users/after_new/#{@tentative_user.id}", notice: 'メールが送信されました'
		else
			render :new
		end
	end

	def after_new
		@tentative_user = TentativeUser.find_by(id: params[:id])
	end


	private
	
	def tentative_user_params
		params.require(:tentative_user).permit(:mail)
	end
end
