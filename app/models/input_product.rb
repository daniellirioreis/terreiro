class InputProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :input
  after_destroy :remove_stock

	after_save :create_stock	

	scope :closed, lambda { |closed| where("inputs.closed = ?", closed).joins(:input) }
	
	
	def value
	    price.to_f * amount.to_f
	end
	
  private
  
  def remove_stock
    if  input.closed
	    remove_product = 0
      stock_product = Stock.find_by_product_id(product_id)
      if stock_product.present?
        remove_product =  stock_product.amount.to_i - amount.to_i 
        stock_product.update_attributes(amount: remove_product)	        
      end
	  end
	end
	
	def create_stock
	  if  input.closed
	    add_product = 0
      stock_product = Stock.find_by_product_id(product_id)
      if stock_product.present?
        add_product =  amount.to_i + stock_product.amount.to_i
        stock_product.update_attributes(amount: add_product)
        stock_product.save!
      else
        stock_product = Stock.new
        stock_product.product_id = product_id
        stock_product.amount =  amount
        stock_product.save!
      end  
	  end
	end
end
