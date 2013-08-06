class ImportagesController < ApplicationController
  before_action :set_importage, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_musician!, :except => [:show]

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

  # POST /importages.json
  def create
    @importage = Importage.new(importage_params)

    respond_to do |format|
      if ownership_check(@importage) && @importage.save
        format.json { render action: 'show', status: :created, location: @importage }
      else
        format.json { render json: @importage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importages/1.json
  def update

    respond_to do |format|
      if ownership_check(@importage) && @importage.update(importage_params)
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @importage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importages/1.json
  def destroy
    if ownership_check(@importage)
      eximportage = @importage.destroy
      respond_to do |format|
        format.json { render :text => "{\"deleted\": #{eximportage.id}}" }
      end
    else
      respond_to do |format|
        format.json { render :text => "{\"not-deleted\": #{@importage.id}}" }
      end
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

  # make sure the current_musician has the rights to edit this
  def ownership_check(importage)
    unless importage.library_id.nil? ^ importage.mix_id.nil?
      raise 'importage #{importage.id} is orphaned or binding a sample to a library and a mix'
    end
    # if a mix importage verify mix.musican
    if importage.mix_id && (importage.mix.musician_id == current_musician.id)
      true
      # if a library importage verify library.musican
    elsif importage.library_id && (importage.library.musician_id == current_musician.id)
      true
    else
      false
    end
  end
end
