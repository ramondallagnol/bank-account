class AccountSerializer < ActiveModel::Serializer
  attributes :id, :number, :agency
  
  belongs_to :client
  belongs_to :bank  
end
