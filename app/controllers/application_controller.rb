class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  
  
  
  private
	
	def message
		@message ||= {}
	end

  helper_method :message

  def define_environment_message
    message[:alert] ||= []
  end
	
end
