class User < ActiveRecord::Base
  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  has_many :wikis
  def set_default_role
    self.role ||= :standard
  end
  
  attr_accessor :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :collaborators, dependent: :destroy
  has_many :wikis, through: :collaborators
  
end
