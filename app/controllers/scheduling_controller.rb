class SchedulingController < ApplicationController
    
    def index 
        unless params[:name].nil? 
            name = params[:name]
            @patient = Patient.find_by_name(params[:name])
            if @patient.nil? 
                redirect_to new_patient_path(from_where: 'scheduling')
            end        
        end 
    end
    
end