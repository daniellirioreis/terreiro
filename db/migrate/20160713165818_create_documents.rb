class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :type_document
      t.text :description

      t.timestamps null: false
    end
  end
end
