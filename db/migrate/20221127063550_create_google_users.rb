class CreateGoogleUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :google_users do |t|
      t.string :mail, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
