class CreateUserSites < ActiveRecord::Migration[6.1]
  def change
    create_table :user_sites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.integer :role, null: false

      t.timestamps
    end
  end
end