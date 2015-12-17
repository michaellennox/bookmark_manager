def sign_in
  visit 'users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'daniela.g@gmail.com'
  fill_in :password, with: 'hola!'
  click_button 'Sign in'
end 
