class Product < ActiveRecord::Base
  has_many :stocks
  validates :name, :description, :minimum_stock, presence: :true
  
  
  scope :sorted_only_product_in_stock, -> { order(:name).joins(:stocks) }
	
  def to_s
    name
  end
end
