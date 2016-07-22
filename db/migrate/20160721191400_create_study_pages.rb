class CreateStudyPages < ActiveRecord::Migration
  def change
    create_table :study_pages do |t|
      t.references :study, index: true, foreign_key: true      
      t.text :description

      t.timestamps null: false
    end
  end
end
