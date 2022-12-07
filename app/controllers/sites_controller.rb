class SitesController < ApplicationController
  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)

    if @site.save
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
