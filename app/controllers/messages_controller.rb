class MessagesController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @message = @user.messages.new(text: message_params[:text], picture: message_params[:picture])
    recipient = User.find(message_params[:recipient_id].to_i)

    if @message.save
      @message.shares.create(user_id: recipient.id)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :picture, :recipient_id)
  end
end
