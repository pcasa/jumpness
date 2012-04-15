class Booking < ActiveRecord::Base
  belongs_to :inflatable
  
  attr_accessible :address, :duration, :inflatable_id, :party_date
  
  validates_presence_of :address, :duration, :party_date, :inflatable_id
end
