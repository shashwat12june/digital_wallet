require '/Users/shashwatsrivastava/Desktop/rubyPrograms/machinecode/digital_wallet/wallet_controller.rb'

wallet = WalletController.new
while(true)
  wallet.execute
end

# CreateWallet Harry 100
# CreateWallet Hunny 120
# CreateWallet Shashwat 650
# Overview
# TransferMoney Harry Hunny 30
# TransferMoney Shashwat Hunny 150
# TransferMoney Hunny Harry 70
# Statement Hunny