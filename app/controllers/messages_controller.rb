class MessagesController < ApplicationController
  def index
    @messages = sort_by_date(Message.all)
  end

  def create
    @message = Message.new(message_params)
    @message.status = its_balanced?(@message.body)

    if @message.save
      flash[:success] = @message.status.to_s
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to root_path
  end

  private

  def its_balanced?(message)
    message = message.gsub(/(:\(|:\)|[a-z]| |:|\([a-z]*:[a-z]*\))/, '')
    valid_braces(message) ? 'balanceado' : 'desbalanceado'
  end

  def valid_braces(braces)
    stack = []
    symbols = { '(' => ')' }

    braces.each_char do |brace|
      stack.last && stack.last == symbols.key(brace) ? stack.pop : stack << brace
    end
    stack.empty?
  end

  def sort_by_date(data)
    data.sort { |message1, message2| message2[:created_at] <=> message1[:created_at] }
  end

  def message_params
    params.require(:message).permit(:body, :status)
  end
end
