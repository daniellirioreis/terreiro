class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  layout :define_layout
  
  private
	
	def message
		@message ||= {}
	end

  helper_method :message

  def define_environment_message
    message[:alert] ||= []
  end
  
  def define_layout
    if user_signed_in?
      if params['action'] == 'print'
        'print'
      else
        if params['controller'] == 'studies'
           if params['action'] == 'show'
             'study'
           else
           end
        else
          if params['controller'] == 'study_pages'
            'study'
          end                  
        end
      end
    else
      'login'
    end 

  end
  
	
end
