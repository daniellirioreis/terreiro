class EventPatientsController < ApplicationController
  before_action :set_event_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_patient, only: [:new, :edit ]
  before_action :set_event, only: [:new, :edit]

  # GET /event_patients
  # GET /event_patients.json
  def index
    @event_patients = EventPatient.all
  end

  # GET /event_patients/1
  # GET /event_patients/1.json
  def show
  end

  # GET /event_patients/new
  def new
    @event_patient = EventPatient.new
    @event_patient.event_id = @event.id
    @event_patient.patient_id = @patient.id
    @back_to = 'patient'
  end

  # GET /event_patients/1/edit
  def edit
    @back_to = params[:back_to]
  end

  # POST /event_patients
  # POST /event_patients.json
  def create
    @event_patient = EventPatient.new(event_patient_params)

    respond_to do |format|
      if @event_patient.save
        format.html { redirect_to @event_patient.patient, notice: "Confirmação para #{@event_patient.event} realizada com sucesso" }
        format.json { render action: 'show', status: :created, location: @event_patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_patients/1
  # PATCH/PUT /event_patients/1.json
  def update
    respond_to do |format|
      if @event_patient.update(event_patient_params)
        if params[:back_to] == "event"
          format.html { redirect_to @event_patient.event, notice: "Confirmação para #{@event_patient.event} realizada com sucesso" }          
        else
          format.html { redirect_to @event_patient.patient, notice: "Confirmação para #{@event_patient.event} realizada com sucesso" }          
        end
        
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_patients/1
  # DELETE /event_patients/1.json
  def destroy
    @event_patient.destroy
    respond_to do |format|
      format.html { redirect_to event_patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_patient
      @event_patient = EventPatient.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_patient_params
      params.require(:event_patient).permit(:event_id, :patient_id, :status_event_patient)
    end
end
