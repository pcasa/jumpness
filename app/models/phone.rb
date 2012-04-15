class Phone < ActiveRecord::Base
  
  has_paper_trail :on => [:update, :destroy]
  
  belongs_to :company, :inverse_of => :phones 
  attr_accessible :company_id, :number, :phone_type, :provider
end
