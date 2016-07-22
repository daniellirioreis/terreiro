class AddImageToStudyPages < ActiveRecord::Migration
  def change
    add_column :study_pages, :image, :string
  end
end
