class SamplesController < ApplicationController
  before_action :set_sample, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_musician!, :except => [:show]

  def grab
    sample = Sample.find(params[:id])
    unless current_musician.library.samples.include? sample
      current_musician.library.samples << sample
    end
    flash[:notice] = 'sample added to your library'
    respond_to do |format|
      format.html { redirect_to action: :show, musician: sample.musician } ###
      format.json {render :json => sample }
    end
  end

  # GET /samples
  # GET /samples.json
  def index
    @samples = Sample.all
    @my_samples = current_musician.library.samples
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
  end

  # GET /samples/new
  def new
    @sample = Sample.new
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples
  # POST /samples.json
  def create

    @sample = Sample.new(sample_params().merge({ musician_id: current_musician.id}))

    respond_to do |format|
      if @sample.save
        format.html { redirect_to :action => :index, notice: 'Sample was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sample }
      else
        format.html { render action: 'new' }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /samples/1
  # PATCH/PUT /samples/1.json
  def update
    respond_to do |format|
      if @sample.update(sample_params)
        format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample.destroy
    respond_to do |format|
      format.html { redirect_to samples_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      @sample = current_musician.samples.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_params
      params.require(:sample).permit(:name, :audio, :desc)
    end
end
