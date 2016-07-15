class AddClosedToInputs < ActiveRecord::Migration
  def change
    add_column :inputs, :closed, :boolean
  end
end
