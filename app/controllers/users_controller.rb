class UsersController < ApplicationController
    skip_before_action :authorize, only: :created

    # POST /signup
    def create
        user = User.create(user_params)
        session[:user_id] = user.id
        render json: user, status: 201 #created
    end

    # GET /me
    def show
        render json: @current_user
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
