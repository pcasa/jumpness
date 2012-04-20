class Company < ActiveRecord::Base
  is_sluggable :name
  
  has_paper_trail :on => [:update, :destroy]
  
  belongs_to :user
  has_many :inflatables
  has_many :phones
  
  attr_accessible :about, :city, :max_radius, :name, :state, :status, :street1, :street2, :user_id, :zipcode, :contact_email, :cached_slug, :phones_attributes, :inflatables_attributes
  
  validates_presence_of :user_id, :contact_email, :name, :max_radius
  
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  accepts_nested_attributes_for :inflatables, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
  
  validates_inclusion_of :status, :in => [:active, :pending, :inactive]
  
  geocoded_by :geocode_address               # can also be an IP address
  after_validation :geocode
  
  STATUS = %w[active pending inactive]

   def status
     read_attribute(:status).to_sym
   end

   def status= (value)
     write_attribute(:status, value.to_s)
   end
   
   def geocode_address
    [street1, street2, city, state, zipcode].join(", ")
   end
     
end
