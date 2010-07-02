class SchoolDistrictsController < ApplicationController


  def index
    @school_districts = SchoolDistrict.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @school_districts }
      format.json { render :json => @school_districts }
    end
  end


  def show
    @school_district = SchoolDistrict.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_district }
      format.json  { render :json => @school_district }
    end
  end


  def new
    @school_district = SchoolDistrict.new
  end


  def edit
    @school_district = SchoolDistrict.find(params[:id])
  end


  def create
    @school_district = SchoolDistrict.new(params[:school_district])
    respond_to do |format|
      if @school_district.save
        flash[:notice] = 'SchoolDistrict was successfully created.'
        format.html { redirect_to(@school_district) }
        format.xml  { render :xml => @school_district, :status => :created, :location => @school_district }
        format.json  { render :json => @school_district, :status => :created, :location => @school_district }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school_district.errors, :status => :unprocessable_entity }
        format.json  { render :json => @school_district.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @school_district = SchoolDistrict.find(params[:id])
    respond_to do |format|
      if @school_district.update_attributes(params[:school_district])
        flash[:notice] = 'SchoolDistrict was successfully updated.'
        format.html { redirect_to(@school_district) }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_district.errors, :status => :unprocessable_entity }
        format.json  { render :json => @school_district.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @school_district = SchoolDistrict.find(params[:id])
    @school_district.destroy
    respond_to do |format|
      format.html { redirect_to(school_districts_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
  
  
end
