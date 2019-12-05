class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 60
      t.string :email, limit: 80
      t.string :string
      t.string :encrypted_password
      t.string :token

      t.timestamps null: false
    end
  end
end
