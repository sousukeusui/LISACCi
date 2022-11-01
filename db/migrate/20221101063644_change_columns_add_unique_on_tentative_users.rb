class ChangeColumnsAddUniqueOnTentativeUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :tentative_users, :mail, unique: true
    add_index :tentative_users, :token, unique: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
