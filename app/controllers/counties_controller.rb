class CountiesController < ApplicationController

  def index
    @counties = County.all(:order => 'name ASC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @counties }
      format.json  { render :json => @counties }
    end
  end


  def show
    @county = County.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @county }
      format.json  { render :json => @county }
    end
  end


  def new
    @county = County.new
  end


  def edit
    @county = County.find(params[:id])
  end


  def create
    @county = County.new(params[:county])
    respond_to do |format|
      if @county.save
        flash[:notice] = 'County was successfully created.'
        format.html { redirect_to(@county) }
        format.xml  { render :xml => @county, :status => :created, :location => @county }
        format.json  { render :json => @county, :status => :created, :location => @county }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @county.errors, :status => :unprocessable_entity }
        format.json  { render :json => @county.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @county = County.find(params[:id])
    respond_to do |format|
      if @county.update_attributes(params[:county])
        flash[:notice] = 'County was successfully updated.'
        format.html { redirect_to(@county) }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @county.errors, :status => :unprocessable_entity }
        format.json  { render :json => @county.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @county = County.find(params[:id])
    @county.destroy
    respond_to do |format|
      format.html { redirect_to(counties_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
  
  
end
