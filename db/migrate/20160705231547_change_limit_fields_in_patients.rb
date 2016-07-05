class ChangeLimitFieldsInPatients < ActiveRecord::Migration
  def change
    change_column :patients, :street, :string, :limit => 255
    change_column :patients, :number_address, :string, :limit => 255
    change_column :patients, :neighborhood, :string, :limit => 255
    change_column :patients, :city, :string, :limit => 255
    change_column :patients, :street, :string, :limit => 255
  end
end
