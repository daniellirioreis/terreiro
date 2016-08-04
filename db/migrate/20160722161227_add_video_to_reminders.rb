class AddVideoToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :video, :string
  end
end
