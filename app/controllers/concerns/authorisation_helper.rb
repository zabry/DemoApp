module AuthorisationHelper

attr_reader :current_user
def authorize_request
    if @current_user = User.find_by(authentication_token: request.headers.env["HTTP_TOKEN"])
        return :current_user

    else 
        head(:unauthorized)
    end
end

end
