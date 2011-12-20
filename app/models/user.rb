class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  acts_as_taggable
  acts_as_taggable_on :skills
  metropoli_for   :city
  
  has_and_belongs_to_many :roles
  
  def role?(role)
    !!self.roles.find_by_name(role.to_s)
  end
end
