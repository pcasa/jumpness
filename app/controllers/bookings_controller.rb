class BookingsController < ApplicationController
  before_filter :find_inflatable
  before_filter :find_or_build_booking
  
  
  def new
  end
  
  def create
    puts "-- what bookings has: #{@booking.inspect}"
    @booking.party_date = DateTime.strptime(params[:booking][:party_date], '%m/%d/%Y %H:%M %p') if params[:booking][:party_date].present?
    
    respond_to do |format|
      if @booking.save
        format.html {redirect_to @booking, :notice => 'Created booking'}
        format.js
      else
        format.html { render action: "new", alert: "Something went wrong" }
      end
    end
  end
  
  def show
    
  end
  
  
  private
    
    def find_inflatable
      @inflatable = Inflatable.find_using_slug(params[:inflatable_id])
      raise ActiveRecord::RecordNotFound unless @inflatable
    end
    
    def find_or_build_booking
      @booking = params[:id] ? @inflatable.bookings.find(params[:id]) : @inflatable.bookings.build(params[:booking])
    end
  
end
