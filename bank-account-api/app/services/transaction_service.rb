class TransactionService
  attr_accessor :transaction

  def self.initialize(params_transaction)
    @transaction = Transaction.new(params_transaction.require(:transaction).permit(:amount, :source_account_id, :destination_account_id))
    set_source_account(params_transaction[:source_account_id])
    set_destination_account(params_transaction[:destination_account_id])
    set_amount(params_transaction[:amount])
  end

  def self.create(params_transaction)
      initialize(params_transaction)
      unless @transaction.errors.any?
        unless @source_account.balance >= @amount
          @transaction.errors.add(:base, "Insufficient funds to perform this transaction")
        else
            @transaction.save!
        end
      end  
      @transaction      
  end

  def self.set_source_account(account_id)
    @source_account = Account.find_by id: account_id
    if @source_account.nil?
      @transaction.errors.add(:base, "Source account not found")
    end
  end

  def self.set_destination_account(destination_account_id)
    @destination_account = Account.find_by id: destination_account_id
    if @destination_account.nil?
      @transaction.errors.add(:base, "Destination account not found")
    end
  end

  def self.set_amount(amount)
    @amount = BigDecimal(amount)
    if @amount <= 0
      @transaction.errors.add(:base, "Amount should greater than zero")
    end
  end

end