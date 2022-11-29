class UsersController < ApplicationController
  def new
    #仮登録時のトークンが正しいかどうか、有効期限が切れてないか調べる
    @tentative_user = TentativeUser.find_by(token: params[:token])
    if @tentative_user.present? && @tentative_user.expired_at > Time.zone.now
      @user = User.new
    else
      render action: :token_error
    end
  end

  def create
    #account_idのパラメーターがあるなら入力されたacount_id、ないなら自動生成
    if params[:user][:account_id].blank?
      @user = User.new(user_params)
      @user.account_id = SecureRandom.alphanumeric(8)
    else
      @user = User.new(user_params)
    end
    #デフォルトのイメージ保存
    @user.image = "image"

    #userを保存に成功時、現場一覧に遷移
    if @user.save
      redirect_to tentative_users_after_new_path
    else
      redirect_to "/users/new/#{params[:user][:token]}"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation, :account_id)
  end
end
