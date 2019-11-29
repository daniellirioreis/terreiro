class Product < ActiveRecord::Base
  has_many :stocks
  has_many :input_products
  has_many :output_products

  validates :name, :description, :minimum_stock, presence: :true

  scope :sorted_only_product_in_stock, -> { order(:name).joins(:stocks) }
  
  scope :sorted, -> { order(:name) }
  
	
  def to_s
    name
  end

  def stock
    stocks.sum(:amount)
  end
end
