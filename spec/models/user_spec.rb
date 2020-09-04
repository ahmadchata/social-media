require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do

    it 'ensures password of user is present' do
      user = User.new(name: 'deepesh', email: 'user@gmail.com').save
      expect(user).to eql(false)
    end


    it 'create a new user' do
      user = User.create(name: 'deepeshh', email: 'dp@gmail.com', password: 'password')
      expect(user) == true
    end

  end
end
