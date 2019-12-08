class TransactionService
  attr_accessor :transaction

  def self.create(params_transaction)
      @transaction = Transaction.new()
      amount = params_transaction[:amount]        
      source_account_id = params_transaction[:source_account_id]
      destination_account_id = params_transaction[:destination_account_id]
      account_source = Account.find_by(id: params_transaction[:source_account_id])
      unless account_source.balance >= params_transaction[:amount]
          @transaction.errors.add(:base, "Saldo insuficiente")
      else
        @transaction.amount = amount
        @transaction.source_account_id = source_account_id          
        @transaction.destination_account_id = destination_account_id
        if @transaction.valid?
          @transaction.save
        end
      end  
      @transaction      
  end

end