class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver)
    @sender = sender
    @receiver = receiver
    @status = pending
  end
  
end
