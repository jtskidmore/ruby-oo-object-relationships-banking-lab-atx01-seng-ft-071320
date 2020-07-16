require 'pry'

class BankAccount

  attr_accessor :balance

  @@all = []

  def initialize (name)
    @name = name
    @balance = 1000
    @status = "open"
    self.class.all << self
  end

  def self.all
    @@all
  end

  def status
    @status
  end

  def name
    @name
  end

  def deposit (amount)
  end

  def display_balance
    gh = balance
    "Your balance is $#{gh}."
  end

  def valid?

  end

  def close_account

  end

end
