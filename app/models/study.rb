class Study < ActiveRecord::Base
  has_many :study_pages, dependent: :destroy
  accepts_nested_attributes_for :study_pages, reject_if: :all_blank, allow_destroy: true

  def to_s
    name
  end
end
