class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if self.valid?
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      "Transaction rejected. Please check you account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
  
end
