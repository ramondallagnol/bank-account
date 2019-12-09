require 'rails_helper'

describe AccountsController, type: :controller do


  describe 'GET #index' do
    context 'all accounts' do    
      it do
        get :index            
        accounts = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET' do
    context 'balance of account' do
      it do
        account = Account.first
        get :balance, params: {account_id: account.id}
        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
      end    
    end
  end
end