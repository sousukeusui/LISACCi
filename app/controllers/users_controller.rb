class UsersController < ApplicationController
  def new
    #仮登録時のトークンが正しいかどうか、有効期限が切れてないか調べる
    token = params[:token]
    p token
  end
end
