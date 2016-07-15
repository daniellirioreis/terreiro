class Document < ActiveRecord::Base
  has_many :document_topics, dependent: :destroy
  accepts_nested_attributes_for :document_topics, reject_if: :all_blank, allow_destroy: true
end
