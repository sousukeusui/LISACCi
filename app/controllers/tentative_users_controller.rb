class TentativeUsersController < ApplicationController
    def new
        @tentative_user = TentativeUser.new
    end

    def create
        @tentative_user = TentativeUser.find_or_initialize_by(tentative_user)
        @tentative_user.token = SecureRandom.base64
        @tentative_user.expired_at = DateTime.now

        if @tentative_user.save
            redirect_to tentative_users_after_new_path, notice: 'メールが送信されました'
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
