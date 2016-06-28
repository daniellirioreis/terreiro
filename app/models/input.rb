class Input < ActiveRecord::Base
  belongs_to :member
  has_many :input_products, dependent: :destroy
  accepts_nested_attributes_for :input_products, reject_if: :all_blank, allow_destroy: true
	validates :date_input, :description, :member_id, presence: true
	
	def value
	  total = 0.0
	   input_products.each do |ip| 
	     total =  total + (ip.price.to_id * ip.amount.to_i)
     end
     total
	end
end
