class Api::V1::UsersController < ApplicationController

    require 'faker'
    before_action :authorize_request, only: [:update]
    
    def index
        @user  = User.all
        render json: @user, status: :ok
    end

    ## Endpoint for User signup
    def create
        @user = User.new(user_params)
        @user.save
        render json: @user, status: :ok
    end

    ##End point for SEND OTP Button

    def sendotp
        otp = Faker::Number.number(digits: 4)
        @user = User.find_by_id(params[:user_id])
        @user.update_attribute(:one_time_password, otp)
        @user.update_attribute(:otp_expires_at, Time.now+10)
        

        ##This should not be done, this otp should be sent to mobile number via thrid-party server
        render json: @user.as_json(only: [:one_time_password]), status: :ok
    end

    
    ## endpoint for Choosing a Board and Classroom
    def update

            @current_user.update_attribute(:board_id, params[:board_id])
            @current_user.update_attribute(:classroom_id, params[:classroom_id])
            render json: @current_user, status: :ok

    end


    private 

    def user_params

        params.permit(:name, :email, :mobile, :dob)
    end

    def auth_user

    end


end
