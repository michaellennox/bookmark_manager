module SessionHelpers
  def sign_up(email: 'testemail@example.com',
              password: 'password_duh',
              password_confirmation: 'password_duh')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Create Account!'
  end

  def sign_in(email: 'testemail@example.com', password: 'password_duh')
    User.create(email: email, password: password, password_confirmation: password)
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In!'
  end
end
