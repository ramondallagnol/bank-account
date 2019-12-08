class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :agency
      t.references :client, null: false, foreign_key: true
      t.references :bank, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
