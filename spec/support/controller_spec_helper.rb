module ControllerSpecHelper
    # generate tokens from user id
    def token_generator(user_id)
      JsonWebToken.encode(user_id: user_id)
    end
  
    # generate expired tokens from user id
    def expired_token_generator(user_id)
      JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
    end
  
    # return valid headers
    def valid_headers
      {
        "token" => token_generator(user.id)
      }
    end
  
    # return invalid headers
    def invalid_headers
      {
        "token" => nil
      }
    end
  end