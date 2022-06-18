class ConversationsController < ApplicationController
  def index
    # @conversations = Conversation.where(sender: current_user).or(Conversation.where(recipient: current_user))
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  def new
    @conversation = Conversation.new
  end

  # private

  # def conversation_params
  #   params.require(:conversation).permit(:)
  # end
end
