feature 'user signing in' do

  scenario 'user signs in' do
    sign_in
    expect(User.count).to eq 1
    expect.page to have_content('Hi, daniela.g@gmail.com')
  end
end
