class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status = 'complete'
      puts "Transaction was already excuted"

    elsif @sender.balance < @amount
      return "Transaction rejected. Please check your account balance."
      @status = 'rejected'
    
    else 
      @receiver.deposit(@amount * -1)
      sender.deposit(@amount)
      @status = 'complete'
    end
    # binding.pry
  end  
end