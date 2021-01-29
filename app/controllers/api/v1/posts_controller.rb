module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded post', data: posts }
      end

      def show
        if @post
          render json: { status: 'success', message: 'loaded the post', data: @post }
        else
          render json: { status: 'failed', message: 'cannot loaded the post' }
        end
      end

      def create

      end

      def update

      end

      def destroy
        if @post
          @post.destroy
          render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
        else
          render json: { status: 'failed', message: 'cannot loaded the post' }
        end
      end

      private

      def set_post
        @post = Post.find_by(id: params[:id])
      end
    end
  end
end

