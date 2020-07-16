require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount

  @@all = []

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    self.class.all << self
  end

  def status
    @status
  end

  def status=(status)
    @status = status
  end

binding.pry
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
binding.pry
  def execute_transaction
    if @status == "pending" && @sender.balance >= @amount
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif @status == "pending" && @sender.balance < @amount
      "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      nil
    end
  end
binding.pry
end
