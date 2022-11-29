class GoogleUsersController < ApplicationController
    require 'googleauth/id_tokens/verifier'

    protect_from_forgery except: :login
    before_action :verify_g_csrf_token

    def login
        payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV['GOOGLE_CLIENT_ID'])
        google_user = GoogleUser.find_or_create_by(mail: payload['email'])
        session[:user_id] = google_user.id
        redirect_to tentative_users_after_new_path, notice: 'ログインしました'
    end

    private

    def verify_g_csrf_token
        if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
          redirect_to tentative_users_new_path, notice: '不正なアクセスです'
        end
    end
end
