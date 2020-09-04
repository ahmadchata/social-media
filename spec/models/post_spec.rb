require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation post test' do
    it 'ensures content of post is present' do
      post1 = Post.new(user_id: 1)
      expect(post1.save).to eql(false)
    end

    it 'create a new post with related user' do
      post1 = Post.create(content: 'For Testing Purpose', user_id: 1)
      expect(post1) == true
    end
  end
end
