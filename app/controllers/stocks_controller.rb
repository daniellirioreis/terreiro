class StocksController < ApplicationController
	before_action :authenticate_user!
  
	def index
    @stocks =  Stock.all
	end
	
	def shopping_list
	  stocks =  Stock.all
	  products = []
	  stocks.each do |s|
	    if s.amount <= s.product.minimum_stock
        products << s.product
	    end
	  end  
	  respond_to do |format|    
  	  if products.any?
  	      @input = Input.new
  	      @input.date_input = Date.current
  	      @input.member = Member.first
  	      @input.description = 'entrada criada através do estoque lista de compra'
  	      if @input.save!
  	         products.each do |p|
  	           input_product = InputProduct.new
  	           input_product.product_id = p[:id]
  	           input_product.input_id = @input.id 
  	           if input_product.save!
  	           else
  	           end   
	           end
	           format.html { redirect_to print_input_path(@input), notice: 'lista de compra criada com suceso! consulte a listagem de entrada.' }      	    
	           
  	      else
	        end
  	  else
  	      format.html { redirect_to stocks_path, alert: 'Não existem produtos abaixo do estoque minimo' }        
      end
    end
	end  
end
