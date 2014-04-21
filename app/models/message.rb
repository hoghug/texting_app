class Message < ActiveRecord::Base
  belongs_to :user
  has_many :shares

  has_attached_file :picture, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
