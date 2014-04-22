class Message < ActiveRecord::Base
  belongs_to :user

  before_create :send_message

  has_attached_file :picture, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/



private

  def send_message
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/ACbab9a50d83f06b33ecd232c9ca7f4720/Messages.json",
        :user => 'ACbab9a50d83f06b33ecd232c9ca7f4720',
        :password => 'dc4fc6dcd8199eb5e34d9fff1b929133',
        :payload => { :Body => self.text,
                      :To => User.find(self.recipient_id).phone.to_i,
                      :From => User.find(self.user_id).phone.to_i }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
