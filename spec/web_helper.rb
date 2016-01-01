def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'testemail@example.com'
  fill_in :password, with: 'password_duh'
  click_button 'Create Account!'
end
