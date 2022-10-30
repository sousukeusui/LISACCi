class CreateTentativeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tentative_users do |t|
      t.string :mail, null: false
      t.string :token, limit: 64, null: false
      t.datetime :expired_at, null: false

      t.timestamps
    end
  end
end
