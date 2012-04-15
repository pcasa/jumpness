class Photo < ActiveRecord::Base
  belongs_to :inflatable
  mount_uploader :image, PhotoUploader 
  
  has_paper_trail :on => [:update, :destroy]
  
  attr_accessible :image, :inflatable_id, :primary, :remove_image, :image_cache
  
  before_create :mark_as_primary
  
 # field :image, :carrierwave
 
 private
 
 def mark_as_primary
  self.primary = true if inflatable.photos.blank?
 end
 
 
end
