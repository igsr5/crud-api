module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded post', data: posts }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
      end

      def create

      end

      def update

      end

      def destroy
        @post.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end

