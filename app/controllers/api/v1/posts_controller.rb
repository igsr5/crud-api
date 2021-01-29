module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded post', data: posts }
      end

      def show

      end

      def new

      end

      def create

      end

      def edit

      end

      def update

      end

      def destroy

      end

      private

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end

