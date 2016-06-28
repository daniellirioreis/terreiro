class CreateOutputProducts < ActiveRecord::Migration
  def change
    create_table :output_products do |t|
      t.references :output, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
