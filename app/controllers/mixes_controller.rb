class MixesController < ApplicationController
  def add_sample
    sample_id = params[:sample_id].to_i
    
    mix_id = params[:id]
    importage = Importage.create!(:sample_id => sample_id,
                                 
                                 :mix_id => mix_id)
  respond_to do |format|
    format.json { render :json => importage}
  end
  end
  
  def tracker
    @mix = Mix.find params[:id]
    @tracks = @mix.samples.uniq
    @xToTimeConst = 10
  end
  
  # GET /mixes
  # GET /mixes.xml
  def index
    @mixes = Mix.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mixes }
    end
  end

  # GET /mixes/1
  # GET /mixes/1.xml
  def show
    @mix = Mix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mix }
    end
  end

  # GET /mixes/new
  # GET /mixes/new.xml
  def new
    @mix = Mix.new
    @mix.musician = current_musician
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mix }
    end
  end

  # GET /mixes/1/edit
  def edit
    @mix = Mix.find(params[:id])
  end

  # POST /mixes
  # POST /mixes.xml
  def create
    @mix = Mix.new(params[:mix])

    respond_to do |format|
      if @mix.save
        format.html { redirect_to(@mix, :notice => 'Mix was successfully created.') }
        format.xml  { render :xml => @mix, :status => :created, :location => @mix }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mixes/1
  # PUT /mixes/1.xml
  def update
    @mix = Mix.find(params[:id])

    respond_to do |format|
      if @mix.update_attributes(params[:mix])
        format.html { redirect_to(@mix, :notice => 'Mix was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mixes/1
  # DELETE /mixes/1.xml
  def destroy
    @mix = Mix.find(params[:id])
    @mix.destroy

    respond_to do |format|
      format.html { redirect_to(mixes_url) }
      format.xml  { head :ok }
    end
  end
end
