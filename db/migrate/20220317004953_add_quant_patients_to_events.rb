class AddQuantPatientsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :quant_patients, :integer
  end
end
