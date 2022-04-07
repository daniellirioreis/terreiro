class PatientsController < ApplicationController
#  before_action :authenticate_user!
  
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.sorted
  end

  def statistics
    @patients = Patient.all    
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @events = Event.by_status(StatusEvent::OPEN)
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @from_where = 'scheduling'
  end

  # GET /patients/1/edit
  def edit
    @patient.birth_date =  @patient.birth_date.strftime("%d/%m/%Y")   unless @patient.birth_date.nil?
    @patient.date_input =  @patient.date_input.strftime("%d/%m/%Y")  unless @patient.date_input.nil?
  end 

  # POST /patients
  # POST /patients.json
  def create
    
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patient_path(id: @patient.id, from_where: params[:from_where] ), notice: 'Paciente criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Paciente atualizado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params[:patient].permit(:name, :street, :number_address, :neighborhood, :city, :state, :zipcode, :email, :birth_date, :phone, :cell_phone, :gender, :job, :date_input)
    end
end
