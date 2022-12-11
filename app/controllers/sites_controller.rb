class SitesController < ApplicationController
  def new
    @site = Site.new
  end

  def create
    #現場情報のインスタンス作成
    site = Site.new(site_params)
    #user_sites中間テーブルにそれぞれ値を保存
    user_site = site.user_sites.new(user_id: current_user.id, site_id: site.id, role: 0)

    if site.save && user_site.save
      redirect_to sites_index_path, notice: '現場を保存しました'
    else
      render action: :new
    end
  end

  private

  def site_params
    params.require(:site).permit(:customer, :name, :address, :content, :construction_date)
  end
end
