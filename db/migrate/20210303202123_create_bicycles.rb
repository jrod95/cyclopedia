class CreateBicycles < ActiveRecord::Migration[6.0]
  def change
    create_table :bicycles do |t|
      t.string :type
      t.string :brand
      t.string :model
      t.integer :size
      t.text :specs
      t.string :gender
      t.boolean :pick_up
      t.references :users, null: false, foreign_key: true
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
