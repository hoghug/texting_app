class ContactsController < ApplicationController
  def create
    @message = Message.new
    if contact_params[:conf] == User.find(contact_params[:entry_id]).phone
      @user = User.find(current_user.id)
      @contact = @user.contacts.new(entry_id: contact_params[:entry_id])

      if @contact.save
        redirect_to :back
      else
        redirect_to :back
      end
    else
      flash[:alert] = "Phone number does not match."
      redirect_to :back
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:entry_id, :conf)
  end
end
