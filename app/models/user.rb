class User < ActiveRecord::Base
  
  # has_attached_file :image styles: { large: "700x700", medium: "300x300>", thumb: "125x125>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
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
  
  # causes error without this line. Ensure that model has the object to identify the resource
  def mailboxer_email(object)
  end
  
end
