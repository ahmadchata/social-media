require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Sign-in process' do
    before :each do
      User.create(name: 'ahmad', email: 'ahmad@ahmad.com', password: '12345678', password_confirmation: '12345678')
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'ahmad@ahmad.com'
        fill_in 'user_password', with: '12345678'
      end
      click_button 'commit'
    end

    it 'sign in with the name' do
      expect(page).to have_content 'ahmad'
    end

    it 'signs me out' do
      click_link('Sign out')
      expect(page).to have_content 'Sign in'
    end
  end
end
