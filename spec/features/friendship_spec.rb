require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  before :each do
    User.create(name: 'ahmad', email: 'ahmad@ahmad.com', password: '12345678', password_confirmation: '12345678')
    User.create(name: 'chata', email: 'chata@chata.com', password: '12345678', password_confirmation: '12345678')
    visit 'users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'ahmad@ahmad.com'
      fill_in 'user_password', with: '12345678'
    end
    click_button 'commit'
    visit '/users'
  end

  it 'send invitations to other users' do
    expect(page).to have_content('Add Friend')
  end

  it 'status changed to pending' do
    click_link('Add Friend')
    expect(page).to have_content('Pending')
  end
end
