class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    return "Your balance is $#{@balance}."
    binding.pry
  end

  def valid?
    if @balance.zero? || @status == 'closed'
      false
    else
      true
    end
  end

  def close_account
    @status = 'closed'
  end
end