class TransactionHistory
  attr_accessor :transaction_time, :action, :amount, :source

  def initialize(action, amount, source)
    self.transaction_time = Time.now.to_s
    self.action = action
    self.amount = amount
    self.source = source
    self.status = 'abc'
  end
end