require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/param_validator.rb'
require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/wallet.rb'
require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/transaction.rb'
require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/display.rb'
require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/admin/delete_account.rb'

class WalletController
  include ParamValidator
  include Display

  attr_accessor :wallets

  def initialize
    self.wallets = []
  end

  def execute
    task = gets.chomp.split(' ')
    action = task.first

    case action
    when 'CreateWallet'
      valid_create_wallet_params?
      create_wallet(task[1].downcase, task[2].to_i)
    when 'TransferMoney'
      valid_transfer_params?
      perform_transaction(task[1].downcase, task[2].downcase, task[3].to_i)
    when 'Overview'
      overview
    when 'Statement'
      statement(task[1].downcase)
    else
      raise "invalid action #{action}"
    end
  end

  private

  def create_wallet(name, amount)
    wallets << Wallet.new(name.downcase, amount)
  end

  def perform_transaction(from, to, amount)
    from_wallet = find_wallet(from)
    to_wallet = find_wallet(to)
    Transaction.new(from_wallet, to_wallet, amount).perform
  end

  def find_wallet(name)
    account = nil
    wallets.each do |x|
      if x.name == name
        account = x
        break
      end
    end
    raise 'invalid account name, retry' unless account
    account
  end

  def overview
    wallets.each do |x|
      puts "#{x.name}  #{x.current_balance}"
    end
  end

  def statement(name)
    wallet = find_wallet(name)
    wallet.history
  end
end
