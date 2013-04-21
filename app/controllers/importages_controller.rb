class ImportagesController < ApplicationController
  # GET /importages
  # GET /importages.xml
  def index
    @importages = Importage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @importages }
    end
  end

  # GET /importages/1
  # GET /importages/1.xml
  def show
    @importage = Importage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @importage }
    end
  end

  # GET /importages/new
  # GET /importages/new.xml
  def new
    @importage = Importage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @importage }
    end
  end

  # GET /importages/1/edit
  def edit
    @importage = Importage.find(params[:id])
  end

  # POST /importages
  # POST /importages.xml
  def create
    @importage = Importage.new(params[:importage])

    respond_to do |format|
      if @importage.save
        format.html { redirect_to(@importage, :notice => 'Importage was successfully created.') }
        format.xml  { render :xml => @importage, :status => :created, :location => @importage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @importage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /importages/1
  # PUT /importages/1.xml
  def update
    @importage = Importage.find(params[:id])

    respond_to do |format|
      if @importage.update_attributes(params[:importage])
        format.html { redirect_to(@importage, :notice => 'Importage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @importage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /importages/1
  # DELETE /importages/1.xml
  def destroy
    @importage = Importage.find(params[:id])
    @importage.destroy

    respond_to do |format|
      format.html { redirect_to(importages_url) }
      format.xml  { head :ok }
    end
  end
end
