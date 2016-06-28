class CreateInputProducts < ActiveRecord::Migration
  def change
    create_table :input_products do |t|
      t.references :input, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.decimal :price
      t.integer :amount

      t.timestamps null: false
    end
  end
end
