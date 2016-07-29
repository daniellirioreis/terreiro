class Output < ActiveRecord::Base
  belongs_to :member
  has_many :output_products, dependent: :destroy
  accepts_nested_attributes_for :output_products, reject_if: :all_blank, allow_destroy: true
	validates :date_output, :description, :member_id, presence: true  
	
	
end
