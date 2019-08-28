require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
#binding.pry
    if @status == 'complete'
      puts "Transaction was already excuted"
    elsif self.sender.balance < @amount || self.sender.status
      return "Transaction rejected. Please check your account balance."
      @status = 'rejected'
    
    else 
      self.sender.deposit(@amount * -1)
      self.receiver.deposit(@amount)
      @status = 'complete'
    end
  end  
end