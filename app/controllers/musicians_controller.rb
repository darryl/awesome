class MusiciansController < ApplicationController
  before_action :authenticate_musician!, :except => [:index, :show]

  def grab
    sample = Sample.find(params[:sample])
    current_musician.library.samples << sample
    flash[:notice] = 'sample added to your library'
    redirect_to action: :show, musician: sample.musician ###
  end

  # GET /musicians
  def index
    @musicians = Musician.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def edit
    @musician = Musician.find(params[:id])
    @sample = Sample.new
    @sample.musician = @musician
  end

end
