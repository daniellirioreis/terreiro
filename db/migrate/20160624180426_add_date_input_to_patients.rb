class AddDateInputToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :date_input, :date
  end
end
