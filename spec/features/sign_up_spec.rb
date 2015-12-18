feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_in }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, andy_htun@hotmail.com')
    expect(User.first.email).to eq('andy_htun@hotmail.com')
  end

  scenario 'no new user is created on mismatched password' do
    expect{sign_in(password_confirmation: 'Bananas')}.not_to change(User, :count)
  end

  scenario 'raises visible error when mismatched password' do
    visit '/users/new'
    expect(page).not_to have_content 'Password does not match confirmation'
    sign_in(password_confirmation: 'Kittens')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'after mismatched password, email is persisted in form' do
    sign_in(password_confirmation: 'Kittens')
    expect(current_path).to eq '/users/new'
    expect(page).to have_selector("input[value='andy_htun@hotmail.com']")
  end

  scenario 'raises error if email format is wrong' do
    sign_in(email: '')
    expect(current_path).to eq '/users/new'
  end
end
