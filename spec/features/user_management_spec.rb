feature 'User Management' do
  scenario 'User can sign up' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(page).to have_content 'Hi, testemail@example.com'
  end

  scenario 'User\'s password must match the password confirmation' do
    expect { sign_up(password_confirmation: 'kittens') }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'User cannot sign up with an incorrectly formatted email' do
    expect { sign_up(email: 'kittens') }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'User cannot sign up with a blank email' do
    expect { sign_up(email: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'User cannot sign up with the same email multiple times' do
    sign_up
    expect { sign_up }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email is already taken'
  end
end
