class ApplicationController < ActionController::API
    
    def authorize_request
        header = request.headers['Authorization']        
        header = header.split(' ').last if header
        begin
            @decoded = decode(header)
            @current_user = Client.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
        end
    end

    def encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
      end
      
    def decode(token)
        decoded = JWT.decode(token, Rails.application.secrets.secret_key_base. to_s)[0]
        puts decoded
        HashWithIndifferentAccess.new decoded
    end    
end
