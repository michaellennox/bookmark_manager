def sign_in
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'andy_htun@hotmail.com'
  fill_in :password, with: 'Apples'
  click_button 'Sign up'
end
