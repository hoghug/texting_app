class MessagesController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @message = @user.messages.new(message_params)

    if @message.save
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
