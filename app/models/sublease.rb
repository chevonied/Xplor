class Sublease < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :image, styles: { large: "700x700", medium: "300x300>", thumb: "125x125>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end
