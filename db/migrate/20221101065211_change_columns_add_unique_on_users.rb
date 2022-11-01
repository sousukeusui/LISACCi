class ChangeColumnsAddUniqueOnUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :mail, unique: true
    add_index :users, :account_id, unique: true
    #Ex:- add_index("admin_users", "username")
    #Ex:- add_index("admin_users", "username")
  end
end
