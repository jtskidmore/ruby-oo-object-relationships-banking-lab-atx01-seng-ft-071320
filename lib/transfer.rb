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

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && @sender.balance >= @amount && @receiver.valid?
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif @status == "pending" && @sender.balance < @amount && @receiver.valid?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    elsif @status == "complete"
      nil
    elsif @status == "pending" && @sender.balance >= @amount && @receiver.valid? == false
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."

    end

  end

end
