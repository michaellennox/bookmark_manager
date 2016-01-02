describe User do
  let!(:user) do
    User.create(email: 'testemail@example.com',
                password: 'password_duh',
                password_confirmation: 'password_duh')
  end

  it 'authenticates when given correct email and password' do
    authenticated = User.authenticate(user.email, 'password_duh')
    expect(authenticated).to eq user
  end

  it 'fails to authenticate when given incorrect password' do
    authenticated = User.authenticate(user.email, 'kittens')
    expect(authenticated).to be nil
  end
end
