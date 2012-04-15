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
  
  
end
