class ChangeColumnsAddDefaultOnSitesProgress < ActiveRecord::Migration[6.1]
  def change
    change_column_default :sites, :progress, 0
  end
end
