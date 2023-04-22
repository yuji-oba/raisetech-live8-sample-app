class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      head :ok
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end