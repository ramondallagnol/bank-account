class Account < ApplicationRecord

  # Associations
  belongs_to :client
  belongs_to :bank

  def has_balance?(amount)
    balance > amount
  end
end
