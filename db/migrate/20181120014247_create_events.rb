class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.float :price
      t.date :date_start
      t.date :date_end
      t.integer :status_event
      
      t.timestamps null: false
    end
  end
end
