class AddVideoToStudyPages < ActiveRecord::Migration
  def change
    add_column :study_pages, :video, :string
  end
end
