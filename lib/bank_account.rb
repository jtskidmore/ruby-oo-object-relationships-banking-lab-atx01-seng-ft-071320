require 'pry'

class BankAccount

  def initialize (name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

end
