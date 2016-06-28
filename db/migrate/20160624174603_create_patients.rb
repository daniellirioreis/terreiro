class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birth_date
      t.string :phone
      t.string :street, limit: 60
      t.string :number_address, limit: 6
      t.string :neighborhood, limit: 20
      t.string :city, limit: 30
      t.integer :state
      t.integer :gender
      t.string :zipcode
      t.string :email, limit: 80
      t.string :cell_phone, limit: 20
      t.timestamps null: false
    end
  end
end
