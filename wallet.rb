class Wallet
  attr_accessor :name, :current_balance, :transactions

  def initialize(name, amount = 0)
    self.name = name
    self.current_balance = nil
    self.transactions = []
  end

  def create(amount)

  end

  def history
    transactions.each do |transaction|
      puts "#{transaction.source} #{transaction.action} #{transaction.amount}"
    end
  end
end