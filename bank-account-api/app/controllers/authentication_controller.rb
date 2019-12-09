class AuthenticationController < ApplicationController
    # before_action :authorize_request, except: :login

    SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

    # POST /auth/login
    def login      
      @client = Client.find_by_email(params[:email])
      if @client&.authenticate(params[:password])
        token = encode(user_id: @client.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       name: @client.name }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end
    
    def decode(token)
        decoded = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decoded
    end    
  
    private
  
    def login_params
      params.permit(:email, :password)
    end
end
