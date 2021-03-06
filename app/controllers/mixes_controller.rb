class MixesController < ApplicationController
  before_action :set_mix, only: [:show, :tracker]
  before_action :set_own_mix, only: [:add_sample, :edit, :update, :destroy]
  before_action :authenticate_musician!, except: [:list, :index, :show, :tracker]

  def add_sample
    sample_id = params[:sample_id].to_i

    importage = Importage.create!(sample_id: sample_id, mix_id: @mix.id)
    respond_to do |format|
      format.json { render json: importage }
    end
  end

  def tracker
    @tracks = @mix.samples.uniq
    @xToTimeConst = 10
  end

  # GET /mixes
  # GET /mixes.json
  def index
    @mixes = Mix.all
  end

  # GET /mixes/1
  # GET /mixes/1.json
  def show
  end

  # GET /mixes/new
  def new
    @mix = Mix.new
  end

  # GET /mixes/1/edit
  def edit
  end

  # POST /mixes
  # POST /mixes.json
  def create
    @mix = Mix.new(mix_params().merge({ musician_id: current_musician.id}))

    respond_to do |format|
      if @mix.save
        format.html { redirect_to tracker_mix_url(@mix), notice: 'new track' }
        format.json { render action: 'show', status: :created, location: @mix }
      else
        format.html { render action: 'new' }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mixes/1
  # PATCH/PUT /mixes/1.json
  def update
    Rails.logger.warn(@mix.methods)
    respond_to do |format|
      if @mix.update(mix_params)
        format.html { redirect_to @mix, notice: 'Track was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixes/1
  # DELETE /mixes/1.json
  def destroy
    @mix.destroy
    respond_to do |format|
      format.html { redirect_to home_m_path }
      format.json { head :no_content }
    end
  end

  private
  def set_mix
    @mix = Mix.find(params[:id])
  end

  def set_own_mix
    @mix = current_musician.mixes.find(params[:id].to_i)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mix_params
    params.require(:mix).permit(:name, :desc)
  end
end
