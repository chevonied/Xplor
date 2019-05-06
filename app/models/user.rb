class User < ActiveRecord::Base
  
  has_many :rentals
  has_many :subleases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # allows users to use mailboxres methods
  acts_as_messageable
  
  def username
    return self.email.split('@')[0]
  end

end
