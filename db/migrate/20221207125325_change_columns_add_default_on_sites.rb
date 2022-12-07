class ChangeColumnsAddDefaultOnSites < ActiveRecord::Migration[6.1]
  def change
    change_column_default :sites, :check, false
    #Ex:- :default =>''
  end
end
