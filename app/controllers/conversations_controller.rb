class ConversationsController < ApplicationController
  def index
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

  private

  def conversation_params
    params.require(:conversation).permit(:name)
  end
end
