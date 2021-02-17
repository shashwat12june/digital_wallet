require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/wallet.rb'
require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/transaction_history.rb'

class Transaction
  attr_accessor :from_account, :to_account, :amount

  def initialize(from_account, to_account, amount)
    self.from_account = from_account
    self.to_account = to_account
    self.amount = amount
  end
  #
  # Todo[@shashwat]: perform this in transaction
  #
  def perform
    validate_transaction
    debit
    credit
    after_transaction
  end

  private

  def validate_transaction
    if from_account.current_balance < amount
      raise 'insufficient balance'
    end
  end

  def debit
    from_account.current_balance = from_account.current_balance - amount
  end

  def credit
    to_account.current_balance = to_account.current_balance + amount
  end

  def after_transaction
    update_transaction_history
    check_offers
  end

  def check_offers
  end

  def update_transaction_history
    to_account.transactions << TransactionHistory.new('credit', amount, "#{from_account.name}")
    from_account.transactions << TransactionHistory.new('debit', amount, "#{to_account.name}")
  end
end