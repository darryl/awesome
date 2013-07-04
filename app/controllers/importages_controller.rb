class ImportagesController < ApplicationController
  before_action :set_importage, only: [:show, :edit, :update, :destroy]

  # GET /importages
  # GET /importages.json
  def index
    @importages = Importage.all
  end

  # GET /importages/1
  # GET /importages/1.json
  def show
  end

  # GET /importages/new
  def new
    @importage = Importage.new
  end

  # GET /importages/1/edit
  def edit
  end

  # POST /importages
  # POST /importages.json
  def create
    @importage = Importage.new(importage_params)

    respond_to do |format|
      if @importage.save
        format.html { redirect_to @importage, notice: 'Importage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @importage }
      else
        format.html { render action: 'new' }
        format.json { render json: @importage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importages/1
  # PATCH/PUT /importages/1.json
  def update
    respond_to do |format|
      if @importage.update(importage_params)
        format.html { redirect_to @importage, notice: 'Importage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @importage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importages/1
  # DELETE /importages/1.json
  def destroy
    @importage.destroy
    respond_to do |format|
      format.html { redirect_to importages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_importage
      @importage = Importage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def importage_params
      params.require(:importage).permit(:start_time, :simple_volume)
    end
end
