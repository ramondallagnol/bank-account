require 'rails_helper'

describe AuthenticationController, type: :controller do
    describe 'POST /auth/login' do
        context 'login succesfull' do
            it do
                client = Client.first
                # Created at seeds.rb
                post :login, params: {name: "Ramon Silveira Dall Agnol", email: "ramonsildallagnol@gmail.com", "password": "123456"}
                response_body = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end    
    
        context 'e-mail blank' do
            it do
                post :login, params: {name: "Ramon Silveira Dall Agnol", "password": "123456"}
                expect(response).to have_http_status(:unauthorized)
            end
        end
    end
    
end