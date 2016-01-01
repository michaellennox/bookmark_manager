feature 'User Management' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(page).to have_content 'Hi, testemail@example.com'
  end

  scenario 'The password must match the password confirmation' do
    expect { sign_up(password_confirmation: 'kittens') }.not_to change { User.count }
  end
end
