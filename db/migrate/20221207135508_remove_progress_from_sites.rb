class RemoveProgressFromSites < ActiveRecord::Migration[6.1]
  def change
    remove_column :sites, :progress
  end
end
