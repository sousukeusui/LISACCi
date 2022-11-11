class UsersController < ApplicationController
  def new
    #仮登録時のトークンが正しいかどうか、有効期限が切れてないか調べる
    if TentativeUser.find_by(token: params[:token])
      @user = User.new
    else
      render action: :token_error
    end
  end
end
