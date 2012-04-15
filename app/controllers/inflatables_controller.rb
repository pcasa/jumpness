class InflatablesController < ApplicationController
  # GET /inflatables
  # GET /inflatables.json
  def index
    @inflatables = Inflatable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inflatables }
    end
  end

  # GET /inflatables/1
  # GET /inflatables/1.json
  def show
    @inflatable = Inflatable.find_using_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inflatable }
    end
  end

  # GET /inflatables/new
  # GET /inflatables/new.json
  def new
    @inflatable = Inflatable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inflatable }
    end
  end

  # GET /inflatables/1/edit
  def edit
    @inflatable = Inflatable.find_using_slug(params[:id])
  end

  # POST /inflatables
  # POST /inflatables.json
  def create
    @inflatable = Inflatable.new(params[:inflatable])

    respond_to do |format|
      if @inflatable.save
        format.html { redirect_to @inflatable, notice: 'Inflatable was successfully created.' }
        format.json { render json: @inflatable, status: :created, location: @inflatable }
      else
        format.html { render action: "new" }
        format.json { render json: @inflatable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inflatables/1
  # PUT /inflatables/1.json
  def update
    @inflatable = Inflatable.find_using_slug(params[:id])

    respond_to do |format|
      if @inflatable.update_attributes(params[:inflatable])
        format.html { redirect_to @inflatable, notice: 'Inflatable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inflatable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inflatables/1
  # DELETE /inflatables/1.json
  def destroy
    @inflatable = Inflatable.find_using_slug(params[:id])
    @inflatable.destroy

    respond_to do |format|
      format.html { redirect_to inflatables_url }
      format.json { head :no_content }
    end
  end
  
  def near_me
    if params[:citystate]
      # origin = Geocoder.coordinates(params[:citystate])
      # puts "-- what origin returned: #{origin}"
      cookies.permanent[:citystate] = params[:citystate] if params[:citystate].present?
      cookies.permanent[:fromdate] = params[:fromdate] if params[:fromdate].present?
      cookies.permanent[:duration] = params[:duration] if params[:duration].present?
      @companies = Company.near(params[:citystate], 100)
      @inflatables = Inflatable.joins(:company).where('companies.id in (?)', @companies.collect{ |c| c.id })
    else
      @inflatables = Inflatable.all
    end
  end
end
