class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.integer :quantity, null:false
      t.date :expiry_date

      t.timestamps null: false
    end
  end
end
