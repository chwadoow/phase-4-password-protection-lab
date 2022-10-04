class UsersController < ApplicationController

    # def create 
    #     user = User.find_by(username: params[:username])
    #     if params[:password] == user.password
    #         session[:user_id] = user.id
    #         render json: user,status: :created
    #     else
    #         render json: {orror: "invalid username or password "},status: :unauthorised
    #     end
    # end

    def create
      
        if params[:password] == params[:password_confirmation]
            user = User.create(user_params)
            session[:user_id]= user.id
            render json: user
        else
            render json: {error: "password dont match"},status: :unprocessable_entity
        end
    end
    def show 
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: {error: "Not authorized"},status: :unauthorized
    end
end

    private
    def user_params
        params.permit(:username,:password,:password_confirmation)
    end
end
