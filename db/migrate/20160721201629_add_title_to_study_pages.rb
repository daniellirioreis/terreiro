class AddTitleToStudyPages < ActiveRecord::Migration
  def change
    add_column :study_pages, :title, :string
  end
end
