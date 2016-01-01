feature 'User Management' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(page).to have_content 'Hi, testemail@example.com'
  end
end
