class ConversationsController < ApplicationController
  def index
    # @conversations = Conversation.where(sender: current_user).or(Conversation.where(recipient: current_user))
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    @messages = @conversation.messages.order(id: :asc)
    # @pet = Pet.find_by id: session[:pet_id]
  end

  def new
    @conversation = Conversation.new
  end

  def create

  end

  # private

  # def conversation_params
  #   params.require(:conversation).permit(:)
  # end
end
