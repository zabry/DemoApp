class Api::V1::SessionsController < ApplicationController

    ## Sign In using OTP
    def create
        @user = User.find_by(mobile: params[:mobile])
        puts @user.one_time_password
        puts params[:one_time_password]

        if @user && @user.one_time_password.to_i == params[:one_time_password].to_i
            @user.update_attribute(:authentication_token, SecureRandom.hex(10))
           render json: @user.as_json(only: [:mobile, :authentication_token]), status: :created
        else
            head(:unauthorized)
        end
    end


    def destroy

    end
    
end
