class User < ActiveRecord::Base
  
  has_paper_trail :on => [:update, :destroy]
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :companies, :class_name => "Company"

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role
  # attr_accessible :title, :body
  
  def full_name
    [first_name, last_name].join(" ")
  end
end
