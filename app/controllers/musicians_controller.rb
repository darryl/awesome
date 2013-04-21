class MusiciansController < ApplicationController

  def grab
    sample = Sample.find(params[:sample])
    current_musician.library.samples << sample
    flash[:notice] = 'sample added to your library'
    redirect_to :action => :show, :musician => sample.musician ###
  end
  
  # GET /musicians
  def index
    @musicians = Musician.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /musicians/1
  def show
    @musician = Musician.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /musicians/new
  def new
    @musician = Musician.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /musicians/1/edit
  def edit
    @musician = Musician.find(params[:id])
    @sample = Sample.new
    @sample.musician = @musician
  end

  # POST /musicians
  def create
    @musician = Musician.new(params[:musician])

    respond_to do |format|
      if @musician.save
        format.html { redirect_to(@musician, :notice => 'Musician was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /musicians/1
  def update
    @musician = Musician.find(params[:id])

    respond_to do |format|
      if @musician.update_attributes(params[:musician])
        format.html { redirect_to(@musician, :notice => 'Musician was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /musicians/1
  def destroy
    @musician = Musician.find(params[:id])
    @musician.destroy

    respond_to do |format|
      format.html { redirect_to(musicians_url) }
    end
  end
  
end
