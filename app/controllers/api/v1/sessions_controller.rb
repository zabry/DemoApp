class Api::V1::SessionsController < ApplicationController

    before_action :authorize_request, only: [:logout]
    
    ## Sign In using OTP
    def create
        @user = User.find_by(mobile: params[:mobile])
        ##puts @user.one_time_password
       ## puts params[:one_time_password]

        if @user && @user.one_time_password.to_i == params[:one_time_password].to_i && @user.otp_expires_at >= Time.now
            @user.update_attribute(:authentication_token, SecureRandom.hex(10))
            @user.update_attribute(:token_expiration, Time.now+1.hour)
           render json: @user.as_json(only: [:mobile, :authentication_token, :token_expiration]), status: :created
        else
            head(:unauthorized)
        end
    end


    ##End Point for Logout Button    
    def logout
        @current_user.update_attribute(:authentication_token, nil)
        @current_user.update_attribute(:token_expiration, nil)
        @current_user.save
        render json: @current_user, status: :ok

    end
    
end
