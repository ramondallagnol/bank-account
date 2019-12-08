class Account < ApplicationRecord

  # Associations
  belongs_to :client
  belongs_to :bank

  def balance
    # Aqui eu poderia fazer tudo na mesma query, mas não tenho conhecimento suficiente do ORM
    Transaction.where(destination_account_id: id).sum(:amount) - Transaction.where(source_account_id: id).sum(:amount)
  end
 
end
