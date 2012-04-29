class Booking < ActiveRecord::Base
  belongs_to :inflatable
  
  
  attr_accessible :address, :duration, :inflatable_id, :party_date, :city, :state, :zip
  
  scope :coming_up, lambda { where("party_date >= ?", 12.hour.ago) } 
  
  validates_presence_of :address, :duration, :party_date, :inflatable_id
  
  
  validates :party_date,
    :date => {:after => Date.today, :message => 'must be after today'},
    :on => :create
  
  validate :inflatable_is_bookable, :party_within_company_range, :on => :create
  
  
  private
  
  def inflatable_is_bookable
    puts "-- what is_bookable is returning: #{inflatable.is_bookable(party_date.strftime('%m/%d/%Y %H:%M %p'), duration)}"
    errors.add(:party_date, "Unable to book for that date") unless inflatable.is_bookable(party_date.strftime('%m/%d/%Y %H:%M %p'), duration)
  end
  
  def address_checker
    # below is regex to remove the /r return character then see if each line is just white space
    #  Looking for at least 2 lines and that characters are at least 5 characters long "1 1st"
    lines = address.gsub(/\r/, "").split(/\n/).select{ |l| l if l.gsub("\r", "").length > 5 && l != nil }
    # throws error if less than 2 lines
    if (lines.length < 2)
      errors.add(:address, "is invalid format<b><br>street<br>city, state zip</b>") 
    else
      # now we take the last line and see if it follows the "city, state zip" format
      city_state_zip_sec = lines.last.split(',')
      if city_state_zip_sec.length != 2 || city_state_zip_sec.last.split(' ').length < 2
        errors.add(:address, "is invalid format for city, state zip (last line)") 
      else
        zip_info = city_state_zip_sec.last.split(' ').last
        errors.add(:address, "zip code is invalid") unless is_number?(zip_info) && zip_info.length == 5
      end
      
    end
  end
  
  def party_within_company_range
    begin
      lines = address.gsub(/\r/, "").split(/\n/).select{ |l| l if l.gsub("\r", "").length > 5 && l != nil }
      dist_from = inflatable.company.distance_from(lines.join(', ')) 
      errors.add(:address, "address to far for delivery") if dist_from > inflatable.company.max_radius
    rescue
      errors.add(:address, "having problem creating with address, please contact site administrator")
    end
  end
  
  def is_number?(num)
    true if Float(num) rescue false
  end
end
