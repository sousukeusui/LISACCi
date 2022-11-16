class UsersController < ApplicationController
  def new
    #仮登録時のトークンが正しいかどうか、有効期限が切れてないか調べる
    @tentative_user = TentativeUser.find_by(token: params[:token])
    if @tentative_user != nil && @tentative_user.expired_at > Time.zone.now
      @user = User.new
    else
      render action: :token_error
    end
  end

  def create
      @user = User.new(user_params)
      #account_idのパラメーターがnullならacount_idを自動生成
      @user.account_id = SecureRandom.alphanumeric(8)
      #デフォルトのイメージ保存
      @user.image = "image"

      #userを保存に成功時、現場一覧に遷移
      if @user.save
        redirect_to tentative_users_after_new_path
      end
  end


  private
  def user_params
      params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
end
