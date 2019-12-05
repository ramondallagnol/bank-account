class Transaction < ApplicationRecord
  belongs_to :source_account, :class_name => 'Account', :foreign_key => 'source_account_id'
  belongs_to :destination_account, :class_name => 'Account', :foreign_key => 'destination_account_id'

  validate :source_account_balance

  def source_account_balance
    puts :source_accountbalance
    #return if :source_account.has_balance(amount)
    #render json: {status: 'ERROR', message: 'Saldo insuficiente'}, status: :conflict     
  end
end