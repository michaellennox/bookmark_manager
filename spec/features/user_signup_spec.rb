feature 'user signing up' do

  scenario 'user signs up' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Hi, daniela.g@gmail.com')
    expect(User.first.email).to eq('daniela.g@gmail.com')
  end

  scenario 'user enters wrong password confirmation' do
    expect {failed_sign_up}.not_to change(User, :count)
    expect(page).not_to have_content('Hi, daniela.g@gmail.com')
  end
end
