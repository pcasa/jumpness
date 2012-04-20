class Inflatable < ActiveRecord::Base
  
  is_sluggable :name
  
  has_paper_trail :on => [:update, :destroy]
  
  belongs_to :company
  has_many :photos,  :dependent => :destroy
  has_many :bookings
  
  attr_accessible :buffer_time, :description, :is_active, :name, :up_to_4_hours, :up_to_8_hours, :cached_slug, :company_id, :photos_attributes
  
  accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  accepts_nested_attributes_for :bookings, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
  
  
  def primary_image
    photos.where(:primary => true).first
  end
  
  def is_bookable(fromdate, duration)
    r = true
    interested_date = DateTime.strptime(fromdate, '%m/%d/%Y %H:%M %p') 
    interested_to = (interested_date + (duration.to_i).hours)
    bookings.coming_up.each do |booking|
      date_range = (booking.party_date..booking.party_date + (booking.duration).hours)
      r = false if date_range.cover?(interested_date) || date_range.cover?(interested_to)
    end
    return r
  end
  
  
end
