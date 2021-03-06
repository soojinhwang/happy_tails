class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "conversations/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
