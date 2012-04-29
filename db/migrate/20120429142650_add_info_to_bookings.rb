class AddInfoToBookings < ActiveRecord::Migration
  def up
    add_column :bookings, :city, :string, :limit => 128
    add_column :bookings, :state, :string, :limit => 32
    add_column :bookings, :zip, :string, :limit => 32
    change_column :bookings, :address, :string
    bookings = Booking.all
    bookings.each do |booking|
      lines = booking.address.gsub(/\r/, "").split(/\n/).select{ |l| l if l.gsub("\r", "").length > 5 && l != nil }
      city_state_zip_sec = lines.last.split(', ')
      booking.update_attributes(:address => lines.first, :city => city_state_zip_sec.first, :state => city_state_zip_sec.last.split(' ').first, :zip => city_state_zip_sec.last.split(' ').last)
    end
  end
  
  def down
    bookings = Booking.all
    bookings.each do |booking|
      new_address = "#{booking.address}\n #{booking.city}, #{booking.state} #{booking.zip}"
      booking.update_attributes(:address => new_address)
    end
    remove_column :bookings, :city
    remove_column :bookings, :state
    remove_column :bookings, :zip
    change_column :bookings, :address, :text
  end
end
