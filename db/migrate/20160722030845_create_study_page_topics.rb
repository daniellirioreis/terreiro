class CreateStudyPageTopics < ActiveRecord::Migration
  def change
    create_table :study_page_topics do |t|
      t.references :study_page, index: true, foreign_key: true
      t.string :number
      t.text :description

      t.timestamps null: false
    end
  end
end
