module Api
  module V1
    class PostsController < ApplicationController
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
    end
  end
end

