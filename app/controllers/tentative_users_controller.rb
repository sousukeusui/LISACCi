class TentativeUsersController < ApplicationController
    def new
        @tentative_user = TentativeUser.new
    end

    def create
        #メールアドレスが登録されていなければ登録
        @tentative_user = TentativeUser.find_or_initialize_by(tentative_user)
        #トークン生成
        @tentative_user.token = create_token
        #現在時刻の登録
        @tentative_user.expired_at = DateTime.now

        if @tentative_user.save
            #メールを送る処理を書く


            redirect_to tentative_users_after_new_path, notice: 'メールが送信されました'
        else
            render :new
        end
    end

    def after_new

    end


    private

    def create_token #トークンを作るメソッド
        token = nil
        loop do #同じトークンがある場合作り直す
            token = SecureRandom.urlsafe_base64
            if TentativeUser.find_by(token: token).nil?
                break
            end
        end
        return token
    end
    
    def tentative_user
        params.require(:tentative_user).permit(:mail)
    end
end
