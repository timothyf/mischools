class SchoolsController < ApplicationController


  def index
    @schools = School.all(:order => 'name ASC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
      format.json  { render :json => @schools }
    end
  end


  def show
    @school = School.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school }
      format.json  { render :json => @school }
    end
  end


  def new
    @school = School.new
  end


  def edit
    @school = School.find(params[:id])
  end


  def create
    @school = School.new(params[:school])
    respond_to do |format|
      if @school.save
        flash[:notice] = 'School was successfully created.'
        format.html { redirect_to(@school) }
        format.xml  { render :xml => @school, :status => :created, :location => @school }
        format.json  { render :json => @school, :status => :created, :location => @school }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
        format.json  { render :json => @school.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @school = School.find(params[:id])
    respond_to do |format|
      if @school.update_attributes(params[:school])
        flash[:notice] = 'School was successfully updated.'
        format.html { redirect_to(@school) }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
        format.json  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to(schools_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
  
  
end
