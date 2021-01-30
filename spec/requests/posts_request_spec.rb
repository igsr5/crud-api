require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET: /posts' do
    before do
      FactoryBot.create_list(:post, 10)
      get '/api/v1/posts'
      @json = JSON.parse(response.body)
    end

    it 'status == 200' do
      expect(response.status).to eq(200)
    end

    it 'can get all post' do
      expect(@json['data'].length).to eq(10)
    end
  end

  context 'GET: /posts/:id' do
    before do
      @post = Post.create(title: 'memo1')
      get "/api/v1/posts/#{@post.id}"
      @json = JSON.parse(response.body)
    end

    it 'status == 200' do
      expect(response.status).to eq(200)
    end

    it 'can get the post' do
      expect(@json['data']['title']).to eq('memo1')
    end
  end

  context 'POST: /posts/create' do
    before do
      @valid_params = { post: { title: 'hoge' } }
      post '/api/v1/posts', params: @valid_params
    end

    it 'status == 200' do
      expect(response.status).to eq(200)
    end

    before do
      @post = Post.first
    end

    it 'can create the post' do
      expect(@post.title).to eq('hoge')
    end
  end

  context 'PUT: api/v1/posts' do
    before do
      @post = Post.create(title: 'memo1')
      @valid_params = { post: { title: 'hoge' } }
      put "/api/v1/posts/#{@post.id}", params: @valid_params
    end

    it 'status == 200' do
      expect(response.status).to eq(200)
    end
  end
end
