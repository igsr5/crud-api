require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with title' do
    post = Post.new(title: 'hoge')
    expect(post).to be_valid
  end
  it 'is invalid with no title' do
    post = Post.new()
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end
end
