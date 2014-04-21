class MessagesController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @message = @user.messages.new(text: message_params[:text], picture: message_params[:picture])
    receiver = User.find(message_params[:receiver_id].to_i)

    if @message.save
      @message.shares.create(user_id: receiver.id)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :picture, :receiver_id)
  end
end
