class ScalesController < ApplicationController
  before_action :set_scale, only: [:show, :edit, :update, :destroy]

  # GET /scales
  # GET /scales.json
  def index
    @scales = Scale.all
  end

  # GET /scales/1
  # GET /scales/1.json
  def show
  end

  # GET /scales/new
  def new
    @scale = Scale.new
  end

  # GET /scales/1/edit
  def edit
    @scale.date =  @scale.date.strftime("%d/%m/%Y")   
  end

  # POST /scales
  # POST /scales.json
  def create
    @scale = Scale.new(scale_params)

    respond_to do |format|
      if @scale.save
        format.html { redirect_to scales_path, notice: 'Escala Criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @scale }
      else
        format.html { render action: 'new' }
        format.json { render json: @scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scales/1
  # PATCH/PUT /scales/1.json
  def update
    respond_to do |format|
      if @scale.update(scale_params)
        format.html { redirect_to scales_path, notice: 'Escala Atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scales/1
  # DELETE /scales/1.json
  def destroy
    @scale.destroy
    respond_to do |format|
      format.html { redirect_to scales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scale
      @scale = Scale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scale_params
      params.require(:scale).permit(:date, :type_scale, :description, :hours, member_scales_attributes: [:id, :member_id, :_destroy])
    end
end
