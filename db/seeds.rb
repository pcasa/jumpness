# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
@user = User.create!(:email => "torianth@gmail.com", :password => "123456", :password_confirmation => "123456", :first_name => "Anthony", :last_name => "Tori", :role => "admin")


# :about, :city, :max_radius, :name, :state, :status, :street1, :street2, :user_id, :zipcode, :cached_slug
#  Jumpness
#  Address: Milford, MI 48380
#  Phone: (248) 880-6797
#  Email: info@jumpness.com
Company.destroy_all
@company = Company.create!(:name => "Jumpness llc", :user_id => @user.id, :street1 => "", :city => "Milford", :state => "MI", :zipcode => 48280, :contact_email => "info@jumpness.com", :max_radius => 40)
Phone.destroy_all
@phone = Phone.create!(:number => "2488806797", :phone_type => "mobile", :provider => "Verizon", :company_id => @company.id)


# Inflatable.destroy_all

#:buffer_time, :d_height, :d_length, :d_width, :description, :inflatable_type, :is_active, :name, :up_to_4_hours, :up_to_8_hours, :cached_slug, :company_id
Inflatable.create(:buffer_time => 30, :description => "Call for last minute specials! A colorful inflatable bounce house that provides a big bouncing area for your event. Whether you call it a bounce house, moon bounce, inflatable or even jumpy thing, this party rental will provide entertainment for any event.", :is_active => true, :name => "Wacky Bouncer", :up_to_4_hours => 165.00, :up_to_8_hours => 195.00, :company_id => @company.id)

Inflatable.create(:buffer_time => 30, :description => "Call for last minute specials. The 5 in 1 Castle Combo bounce house is exciting for all ages. Your guests will be entertained when they jump in the large bouncing area, crawl through to the exciting climbing obstacle that leads to the slide or participate in a basketball game with the interior and exterior nets. Bounce for a dunk or try your luck at a long distance shot! Hopefully nobody will bounce and block your shot! There are so many features on this bounce house that you can be creative and make up your own games.", :is_active => true, :name => "5 in 1 Castle Combo", :up_to_4_hours => 250.00, :up_to_8_hours => 295.00, :company_id => @company.id)

Inflatable.create(:buffer_time => 30, :description => "This bounce house allows you to go head to head with friends, family or enemies if you choose. Battle it out to become the ultimate gladiator at the event. Play around on this inflatable bounce house or create a tournament.", :is_active => true, :name => "Gladiator Joust", :up_to_4_hours => 350.00, :up_to_8_hours => 375.00, :company_id => @company.id)

Inflatable.create(:buffer_time => 30, :description => "This is the popular inflatable water slide that can also be used as a dry slide. Slides are always popular and will be a hit at any type of event. The price you see is the price you pay. Period.", :is_active => true, :name => "18 ft Dry Slide", :up_to_4_hours => 250.00, :up_to_8_hours => 295.00, :company_id => @company.id)

Inflatable.create(:buffer_time => 30, :description => "Brand new for 2011! This is a 30' long obstacle course including dual lanes and a rock climbing slide. Perfect for larger events of all ages.", :is_active => true, :name => "30 ft Obstacle", :up_to_4_hours => 450.00, :up_to_8_hours => 500.00, :company_id => @company.id)

Inflatable.create(:buffer_time => 30, :description => "A 15x15 castle bounce house that is entertaining for all ages and events. Available April 2012.", :is_active => true, :name => "Castle Bouncer", :up_to_4_hours => 175.00, :up_to_8_hours => 195.00, :company_id => @company.id)

Inflatable.create(:buffer_time => 30, :description => "A colorful 5 in 1 combo with all enclosed features. This bounce house has a basketball net, a climbing obstacle leading to the slide, pop up obstacles and a large jumping area. Available April 2012.", :is_active => true, :name => "5 in 1 Combo", :up_to_4_hours => 265.00, :up_to_8_hours => 295.00, :company_id => @company.id)

Inflatable.create(:buffer_time => 30, :description => "This combo is slightly smaller than our 5 in 1 combos. Features include a basketball net, a climbing obstacle leading to the slide and a large jumping area. Available April 2012.", :is_active => true, :name => "C4 Castle Combo", :up_to_4_hours => 240.00, :up_to_8_hours => 260.00, :company_id => @company.id)


