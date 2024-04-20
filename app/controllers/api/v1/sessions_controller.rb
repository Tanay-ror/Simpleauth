module Api
  module V1
    class SessionsController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        user = User.find_by(email: session_params[:email])
        if user && user.authenticate(session_params[:password])
          render json: { message: 'Logged in successfully!', user_id: user.id }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
      end

      private

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end
