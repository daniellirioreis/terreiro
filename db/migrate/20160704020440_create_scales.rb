class CreateScales < ActiveRecord::Migration
  def change
    create_table :scales do |t|
      t.date :date
      t.integer :type_scale
      t.text :description
      t.time :hours
      t.timestamps null: false
    end
  end
end
