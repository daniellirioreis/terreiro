class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.date :date_output
      t.text :description
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
