class CreateDocumentTopics < ActiveRecord::Migration
  def change
    create_table :document_topics do |t|
      t.references :document, index: true, foreign_key: true
      t.string :number
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
