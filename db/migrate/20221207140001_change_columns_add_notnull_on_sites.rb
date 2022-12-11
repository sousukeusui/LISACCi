class ChangeColumnsAddNotnullOnSites < ActiveRecord::Migration[6.1]
  def change
    change_column :sites, :progress, :integer, null: false, defalut: 0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
