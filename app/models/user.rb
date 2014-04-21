class User < ActiveRecord::Base

  has_many :messages
  has_many :shares
  has_many :contacts


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def username(user)
    email[0...(user.email.index('@'))]
  end

end
