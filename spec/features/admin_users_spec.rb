require 'spec_helper'

feature 'creating a user' do
  scenario 'user creates a new admin user' do
    log_in_admin_user
    visit new_admin_user_path
    fill_in 'Email', with: 'test@example.com'
    find('#user_password_confirmation').set('password')
    find('#user_password').set('password')
    find('input[type="submit"]').click

    expect(current_path).to eq(admin_user_path(AdminUser.find_by(email: 'test@example.com')))
  end
end
