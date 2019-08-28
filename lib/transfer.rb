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
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && @status == 'pending'
      if amount < self.sender.balance
        self.sender.balance -= amount
        self.receiver.balance += amount
        @status = 'complete'
      else
         @status = 'rejected'
         'Transaction rejected. Please check your account balance.'
      end
    else
       @status = 'rejected'
       'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if valid? && @status == 'complete'
      if amount < self.receiver.balance
        self.receiver.balance -= amount
        self.sender.balance += amount
        @status = 'reversed'
      else
         @status = 'rejected'
         'Transaction rejected. Please check your account balance.'
      end
    else
       @status = 'rejected'
       'Transaction rejected. Please check your account balance.'
    end
  end
end
