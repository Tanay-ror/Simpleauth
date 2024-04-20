module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authorize_user

      def index
        posts = current_user.posts.page(params[:page]).per(10)
        render json: posts
      end

      def create
        post = current_user.posts.new(post_params)
        if post.save
          render json: post, status: :created
        else
          render_errors(post)
        end
      end

      private

      def post_params
        params.permit(:title, :content)
      end

      def authorize_user
        head :unauthorized unless current_user
      end

      def render_errors(record)
        render json: { error: record.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
