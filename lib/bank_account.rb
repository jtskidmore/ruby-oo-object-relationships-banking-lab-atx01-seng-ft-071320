require 'pry'

class BankAccount

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

  def balance
    @balance
  end

  def name
    @name
  end

  def deposit (amount)
    
  end

  def display_balance
    
  end

  def valid? 
    
  end

  def close_account
    
  end

end
