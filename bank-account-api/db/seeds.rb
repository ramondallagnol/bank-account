# Generate banks
puts "Generating the BANKS..."
banks = [{"name" =>"Banco do Brasil S.A.", "code" => "001"},
        {"name" => "Banco Itaú S.A.", "code" => "341"},
        {"name" => "Banco Santander (Brasil) S.A.", "code" => "033"},
        {"name" => "Itaú Unibanco Holding S.A.", "code" => "652"},
        {"name" => "Banco Bradesco S.A.", "code" => "237"},
        {"name" => "Banco Citibank S.A.", "code" => "745"},
        {"name" => "HSBC Bank Brasil S.A.", "code" => "399"},
        {"name" => "Caixa Econômica Federal", "code" => "104"},
        {"name" => "Banco Mercantil do Brasil S.A.", "code" => "389"},
        {"name" => "Banco Rural S.A.", "code" => "453"},
        {"name" => "Banco Safra S.A.", "code" => "422"},
        {"name" => "Banco Rendimento S.A.", "code" => "633"}]
            
banks.each do |bank|
    Bank.find_or_create_by!(name: bank['name'], code: bank['name'])
end            
puts "BANKS generated!"

# Generate Clients
puts "Generating the CLIENTS"
ramon  = Client.create!(name: "Ramon Silveira Dall Agnol", email: "ramonsildallagnol@gmail.com", "password": "123456")
karina = Client.create!(name: "Karina Resner", email: "karina.resner@gmail.com", "password": "123456")
puts "CLIENTS generated!"

# Generate Accounts
puts "Generating the ACCOUNTS"
Account.find_or_create_by!(number: "001245", agency: "1233", client_id: ramon.id, bank_id: 1)
Account.find_or_create_by!(number: "08088", agency: "1233", client_id: karina.id, bank_id: 2)
puts "ACCOUNTS generated!"

# Generate Transactions
puts "Generating the TRANSACTIONS"
Transaction.create!(amount: "1000", source_account_id: 1, destination_account_id: 2)
puts "TRANSACTIONS generated!"