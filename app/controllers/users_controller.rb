class UsersController < ApplicationController
  def new
    #仮登録時のトークンが正しいかどうか、有効期限が切れてないか調べる
    tentative_user = TentativeUser.find_by(token: params[:token])
    if tentative_user != nil && tentative_user.expired_at > Time.zone.now
      @user = User.new
    else
      render action: :token_error
    end
  end
end
