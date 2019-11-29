class StocksController < ApplicationController
	before_action :authenticate_user!
  
	def index
    @products = Product.sorted
	end
	
	def shopping_list
    @stocks = Stock.all
	end  
end
