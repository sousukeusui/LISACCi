class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 16, null: false
      t.string :mail, null: false
      t.string :password_digest, null: false
      t.string :account_id, limit: 16, null: false
      t.string :image, null: false
      t.string :self_introduction, limit: 100
      t.string :position, limit: 10

      t.timestamps
    end
  end
end
