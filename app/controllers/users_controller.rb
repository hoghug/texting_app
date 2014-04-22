class UsersController < ApplicationController
  def show
    if !user_signed_in?
      redirect_to "/users/sign_in"
    else
      @message = Message.new
      existing_contacts = current_user.contacts
      @users = User.all - [User.find(current_user.id)]

      @users.reject! {|c| existing_contacts.include?(c) }

      @contact = Contact.new
    end
  end
end
