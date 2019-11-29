class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
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
        if params['controller'] == 'members'
          if params['action'] == 'show'
            'print'
          else
          end
        end                  
        if params['controller'] == 'documents'
          if params['action'] == 'show'
            'print'
          else
          end
        end
        if params['controller'] == 'stocks'
          if params['action'] == 'shopping_list'
            'print'
          else
          end
        end
      end
    else
      if params['controller'] == 'studies'
         if params['action'] == 'show'
           'study'
         else
         end
      else
        if params['controller'] == 'study_pages'
          'study'
        else
          'login'                           
        end                  
      end      
    end 

  end
  
	
end
