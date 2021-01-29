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
        post = Post.new(post_params)
        if post.save
          render json: { status: 'SUCCESS', message: 'Create the post', data: post }
        else
          render json: { status: 'FAILED', message: 'cannot create the post',data: post.errors }
        end
      end

      def update
        if @post.update(post_params)
          render json: { status: 'SUCCESS', message: 'Update the post', data: @post }
        else
          render json: { status: 'FAILED', message: 'cannot Update the post', data: @post.errors }
        end
      end

      def destroy
        if @post
          @post.destroy
          render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
        else
          render json: { status: 'failed', message: 'cannot loaded the post'}
        end
      end

      private

      def set_post
        @post = Post.find_by(id: params[:id])
      end

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end

