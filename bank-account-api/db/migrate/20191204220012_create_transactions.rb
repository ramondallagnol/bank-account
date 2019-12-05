class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.references :source_account
      t.references :destination_account

      t.timestamps null: false
    end
  end
end