class ContactsController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @contact = @user.contacts.new(contact_params)

    if @contact.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:entry_id)
  end
end
