class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :title
      t.string :subtitle
      t.integer :color_title
      t.integer :color_subtitle
      t.string :image
      t.text :description

      t.timestamps null: false
    end
  end
end
