require 'rails_helper'

describe ClientsController, type: :controller do
    describe 'GET #index' do
        context 'all clients' do
            it do
                get :index
                clients = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end
    end

    describe 'POST #create' do
        context 'valid new client' do
            it do
                post :create, params: {client:{email:'felipedasilveira@gmail.com', name:'Felipe', password:'654321'}}
                expect(response).to have_http_status(:success)
            end
        end

        context 'password less than 6 characters' do
            it do
                post :create, params: {client:{email:'felipedasilveira@gmail.com', name:'Felipe', password:'12345'}}
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end

        context 'e-mail wrong' do
            it do
                post :create, params: {client:{email:'felipedasilveira#gmail.com', name:'Felipe', password:'12345'}}
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end    

end