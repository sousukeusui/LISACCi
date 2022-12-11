class ChangeColumnsAddDefalutOnSites < ActiveRecord::Migration[6.1]
  def change
    change_column_default :sites, :progress, '未完了'
  end
end
