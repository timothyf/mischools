class EnrollmentsController < ApplicationController


  def index
    @enrollments = Enrollment.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @enrollments }
      format.json  { render :json => @enrollments }
    end
  end


  def show
    @enrollment = Enrollment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @enrollment }
      format.json  { render :json => @enrollment }
    end
  end


  def new
    @enrollment = Enrollment.new
  end


  def edit
    @enrollment = Enrollment.find(params[:id])
  end


  def create
    @enrollment = Enrollment.new(params[:enrollment])
    respond_to do |format|
      if @enrollment.save
        flash[:notice] = 'Enrollment was successfully created.'
        format.html { redirect_to(@enrollment) }
        format.xml  { render :xml => @enrollment, :status => :created, :location => @enrollment }
        format.json  { render :json => @enrollment, :status => :created, :location => @enrollment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @enrollment.errors, :status => :unprocessable_entity }
        format.json  { render :json => @enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @enrollment = Enrollment.find(params[:id])
    respond_to do |format|
      if @enrollment.update_attributes(params[:enrollment])
        flash[:notice] = 'Enrollment was successfully updated.'
        format.html { redirect_to(@enrollment) }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @enrollment.errors, :status => :unprocessable_entity }
        format.json  { render :json => @enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to(enrollments_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
  
  
end
