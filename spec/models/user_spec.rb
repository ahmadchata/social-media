require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) do
    User.create(name: 'apple', email: 'apple@apple.com',
                password: '123456', password_confirmation: '123456')
  end
  let(:user2) do
    User.create(name: 'banana', email: 'banana@banana.com',
                password: '123456', password_confirmation: '123456')
  end

  let(:friendship) { Friendship.create(user_id: user1.id, friend_id: user2.id) }

  describe '2 rows for mutual friendship' do
    it 'creates a second row when invitation is confirmed' do
      Friendship.create(user_id: user2.id, friend_id: user1.id)
      user1.confirm_friend(user2)
      row = Friendship.where(user_id: user1.id, friend_id: user2.id, confirmed: true)
      expect(row.empty?).not_to be true
    end
  end

  context 'validation user test' do
    it 'ensures password of user is present' do
      user = User.new(name: 'ahmad', email: 'ahmad@ahmad.com').save
      expect(user).to eql(false)
    end

    it 'creates a new user' do
      user = User.create(name: 'ahmad', email: 'ahmad@ahmad.com', password: '12345678')
      expect(user) == true
    end
  end

  context 'helper methods test' do
    before(:each) do
      @user1 = User.create(name: 'User1', email: 'user1@gmail.com', password: 'password')
      @user2 = User.create(name: 'User2', email: 'user2@gmail.com', password: 'password')
    end

    it 'should return empty friends' do
      expect(@user1.friends.empty?).to eq(true)
    end

    it 'should return one requested friend request' do
      @user1.friendships.new(friend_id: @user2.id, confirmed: false).save
      expect(@user2.friend_requests.length).to eq(1)
    end

    it 'should return one pending friend request' do
      @user1.friendships.new(friend_id: @user2.id, confirmed: false).save
      expect(@user1.pending_friends.length).to eq(1)
    end

    it 'should confirm the requested friend request' do
      @user1.friendships.new(friend_id: @user2.id, confirmed: false).save
      @user2.confirm_friend(@user1)
      expect(@user1.friendships.first.confirmed).to eq(true)
    end

    it 'should reject the friend request' do
      @user1.friendships.new(friend_id: @user2.id, confirmed: false).save
      @user2.reject_friend(@user1)
      expect(@user1.friendships.size).to eq(0)
    end

    it 'should confirm the friendship' do
      @user1.friendships.new(friend_id: @user2.id, confirmed: false).save
      @user2.confirm_friend(@user1)
      expect(@user1.friend?(@user2)).to eq(true)
    end
  end
end
