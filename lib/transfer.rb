require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" 
      if @sender.balance > @amount
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else
        "Transaction rejected. Please check your account balance."
      end
    else
      nil
    end
  end

end
