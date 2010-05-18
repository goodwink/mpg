class FillupsController < ApplicationController
  # GET /fillups
  # GET /fillups.xml
  def index
    @fillups = Fillup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fillups }
    end
  end

  # GET /fillups/1
  # GET /fillups/1.xml
  def show
    @fillup = Fillup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fillup }
    end
  end

  # GET /fillups/new
  # GET /fillups/new.xml
  def new
    @fillup = Fillup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fillup }
    end
  end

  # GET /fillups/1/edit
  def edit
    @fillup = Fillup.find(params[:id])
  end

  # POST /fillups
  # POST /fillups.xml
  def create
    @fillup = Fillup.new(params[:fillup])
    @fillup.mpg = @fillup.miles_since_last_fillup / @fillup.gallons

    respond_to do |format|
      if @fillup.save
        format.html { redirect_to(@fillup, :notice => 'Fillup was successfully created.') }
        format.xml  { render :xml => @fillup, :status => :created, :location => @fillup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fillup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fillups/1
  # PUT /fillups/1.xml
  def update
    @fillup = Fillup.find(params[:id])
    @fillup.mpg = @fillup.miles / @fillup.gallons

    respond_to do |format|
      if @fillup.update_attributes(params[:fillup])
        format.html { redirect_to(@fillup, :notice => 'Fillup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fillup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fillups/1
  # DELETE /fillups/1.xml
  def destroy
    @fillup = Fillup.find(params[:id])
    @fillup.destroy

    respond_to do |format|
      format.html { redirect_to(fillups_url) }
      format.xml  { head :ok }
    end
  end
end
