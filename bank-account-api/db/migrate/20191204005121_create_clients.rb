class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 60
      t.string :email, limit: 80
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
