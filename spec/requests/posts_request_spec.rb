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

    it 'all post' do
      expect(@json['data'].length).to eq(10)
    end
  end
end
