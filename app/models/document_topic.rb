class DocumentTopic < ActiveRecord::Base
  belongs_to :document
  has_many :document_topic_sub_topics, dependent: :destroy
  accepts_nested_attributes_for :document_topic_sub_topics, reject_if: :all_blank, allow_destroy: true
end
