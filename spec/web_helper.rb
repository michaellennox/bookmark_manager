def sign_up(email: 'testemail@example.com',
            password: 'password_duh',
            password_confirmation: 'password_duh')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Create Account!'
end
