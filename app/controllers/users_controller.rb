class UsersController < ApplicationController
  def show
    if !user_signed_in?
      redirect_to "/users/sign_in"
    else
      @message = Message.new
      existing_contacts = current_user.contacts
      @users = User.all - [User.find(current_user.id)] - existing_contacts.map! {|c| User.find(c.entry_id)}
      @contact = Contact.new
    end
  end
end
