require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    self.class.all << self
  end

  def self.all
    @@all
  end

  def status
    @status
  end

  def status=(status)
    @status = status
  end


  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

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
  
end
