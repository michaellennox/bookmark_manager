feature 'user signing up' do

  scenario 'user signs up' do
    # expect(User.count).to eq 0
    # sign_in
    # expect(User.count).to eq 1
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Hi, daniela.g@gmail.com')
    expect(User.first.email).to eq('daniela.g@gmail.com')
  end
end
