class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        render json: user

        # if user && user.authenticate(params[:session][:password])
        #     log_in user
        #     redirect_to user
        # else
        #     flash.now[:danger] = 'Invalid email/password combination'
        #     render 'new'
        # end
    end

    def destroy
        session.delete(:user_id)
        head :no_content, status: 204
    end
end
