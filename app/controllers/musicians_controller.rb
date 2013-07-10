class MusiciansController < ApplicationController
  before_action :authenticate_musician!, :except => [:index, :show]

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
