class BookingsController < ApplicationController
  before_filter :find_inflatable
  before_filter :find_or_build_booking
  
  rescue_from ArgumentError do |exception|
   if exception.message == 'invalid date'
     flash[:error] = exception.message
     redirect_to request.referer ? :back : root_url
   else
     raise StandardError, exception.message, exception.backtrace
   end
  end
  
  
  def new
  end
  
  def create
    puts "-- what bookings has: #{@booking.inspect} but params has: #{params}"
    cookies.permanent[:fromdate] = params[:booking][:party_date] if params[:booking][:party_date].present?
    cookies.permanent[:duration] = params[:booking][:duration] if params[:booking][:duration].present?
    @booking.party_date = DateTime.strptime(params[:booking][:party_date], '%m/%d/%Y %H:%M %p') if params[:booking][:party_date].present?
    
    respond_to do |format|
      if @booking.save
        cookies.delete :citystate
        cookies.delete :fromdate
        cookies.delete :duration
        format.html {redirect_to [@inflatable, @booking], :notice => 'Created booking'}
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
