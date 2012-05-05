class InflatablesController < ApplicationController
  # GET /inflatables
  # GET /inflatables.json
  
  rescue_from ArgumentError do |exception|
   if exception.message == 'invalid date'
     cookies.delete :fromdate
     cookies.delete :duration
     flash[:error] = exception.message
     redirect_to request.referer ? :back : root_url
   else
     raise StandardError, exception.message, exception.backtrace
   end
  end
  
  
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
    puts "-- params that came in: #{params}"
    if params[:citystate].present?
      city_state = params[:citystate].split(', ').length > 1 ? params[:citystate] : params[:citystate] = "#{params[:citystate]}, MI"
      duration = (params[:to].to_i - params[:from].to_i)
      if params[:from].to_i > 12
        datetime = "#{params[:date]} #{(params[:from].to_i - 12)}:00 pm"
      elsif params[:from].to_i == 12
        datetime = "#{params[:date]} #{(params[:from].to_i)}:00 pm"
      else
        datetime = "#{params[:date]} #{(params[:from].to_i)}:00 am"
      end
      puts "-- setting date time as: #{datetime}"
      cookies.permanent[:citystate] = city_state 
      cookies.permanent[:fromdate] = datetime 
      cookies.permanent[:duration] = duration 
      @companies = Company.near(city_state, 100)
      @inflatables = Inflatable.joins(:company).where('companies.id in (?)', @companies.collect{ |c| c.id })
    else
      @inflatables = Inflatable.all
    end
  end
end
