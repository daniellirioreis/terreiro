class AddJobToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :job, :string
  end
end
