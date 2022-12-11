class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :customer, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :content, null: false
      t.date :construction_date, null: false
      t.string :progress, null: false
      t.boolean :check, null: false

      t.timestamps
    end
  end
end
