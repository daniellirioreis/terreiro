class StudyPage < ActiveRecord::Base
  belongs_to :study
  
  has_many :study_page_topics, dependent: :destroy
  accepts_nested_attributes_for :study_page_topics, reject_if: :all_blank, allow_destroy: true
  
  
  scope :study_id, lambda { |study_id| where(:study_id => "#{study_id}") }
  
end
