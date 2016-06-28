class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.date :date_input
      t.text :description
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
