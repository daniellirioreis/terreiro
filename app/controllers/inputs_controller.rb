class InputsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_input, only: [:show,:destroy, :edit, :update, :print]

  # GET /inputs
  # GET /inputs.json
  def index
    @inputs = Input.all
  end

  # GET /inputs/1
  # GET /inputs/1.json
  def show
  end

  def print
  end

  # GET /inputs/new
  def new
    @input = Input.new
  end

  # GET /inputs/1/edit
  def edit
    
    @input.date_input =  @input.date_input.strftime("%d/%m/%Y")
  end

  # POST /inputs
  # POST /inputs.json
  def create
    @input = Input.new(input_params)

    respond_to do |format|
      if @input.save
        format.html { redirect_to @input, notice: 'Entrada criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @input }
      else
        format.html { render action: 'new' }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inputs/1
  # PATCH/PUT /inputs/1.json
  def update
    respond_to do |format|
      if @input.update(input_params)
        format.html { redirect_to @input, notice: 'Entrada atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inputs/1
  # DELETE /inputs/1.json
  def destroy
    @input.destroy
    respond_to do |format|
      format.html { redirect_to inputs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input
      @input = Input.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_params
      params.require(:input).permit(:date_input, :description, :member_id, :closed, input_products_attributes: [:id, :input_id, :product_id,:price, :amount, :_destroy])
    end
end
