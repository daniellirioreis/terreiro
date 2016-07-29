class OutputProduct < ActiveRecord::Base
  belongs_to :output
  belongs_to :product
  
  after_save :remove_stock
  after_destroy :create_stock	
  validate :confirm_stock
  
	scope :product_id, lambda { |product_id| where("ouput_products.product_id = ?", product_id)}
	
  private
  
  def confirm_stock
    stock_product = Stock.find_by_product_id(product_id)
    if stock_product.present?
      if amount.to_i > stock_product.amount
        errors.add(:amount, "não possui essa quantidade em estoque. quantidade em estoque é  #{stock_product.amount}") 
      else
        errors.add(:amount, "quantidade da saída  não pode ser #{stock_product.amount}") if stock_product.amount.zero?
      end
    end
  end
  
	def remove_stock
 	  remove_product = 0
     stock_product = Stock.find_by_product_id(product_id)
     if stock_product.present?
       remove_product =  stock_product.amount.to_i - amount.to_i 
       stock_product.update_attributes(amount: remove_product)	        
     end
 	end

 	def create_stock
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
