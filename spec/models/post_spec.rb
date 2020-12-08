require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation post test' do
    it { should validate_presence_of(:content) }

    it 'create a new post with related user' do
      post1 = Post.create(content: 'Testing', user_id: 1)
      expect(post1) == true
    end
  end
end
