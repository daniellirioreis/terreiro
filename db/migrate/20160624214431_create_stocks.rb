class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
