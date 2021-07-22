module AuthorisationHelper


#Authorisation Helper method to check the token
attr_reader :current_user
def authorize_request
    #if @current_user = User.find_by(authentication_token: request.headers.env["HTTP_TOKEN"])
        #return :current_user
    #else 
        #head(:unauthorized)
    #end

    header = request.headers['token']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])

      return :current_user


    rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
    end
end

end
