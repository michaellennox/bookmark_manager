feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_in }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, andy_htun@hotmail.com')
    expect(User.first.email).to eq('andy_htun@hotmail.com')
  end

  scenario 'no new user is created on mismatched password' do
    expect{sign_in(password_confirmation: 'Bananas')}.not_to change(User, :count)
  end
end

# scenario 'check email for user is correct in database' do
#   sign_in
#   click_button 'Sign up'
#   user = User.first
#   expect(user.email(&:email))
# end
