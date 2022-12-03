class TentativeUsersController < ApplicationController
    def new
        @tentative_user = TentativeUser.new
    end

    def create
        #仮ユーザー作る
        @tentative_user = TentativeUser.new(tentative_user)
        #期限時間の登録
        @tentative_user.expired_at = Time.zone.now + 1.days

        if @tentative_user.save
            #メールを送る処理を書く
            UserMailer.registration_mail(@tentative_user).deliver_later
            redirect_to tentative_users_after_new_path, notice: 'メールが送信されました' #工事一覧画面に遷移させるため後ほどpath変える
        else
            render :new
        end
    end

    def after_new

    end


    private
    
    def tentative_user
        params.require(:tentative_user).permit(:mail)
    end
end
