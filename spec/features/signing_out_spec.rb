feature 'User Signout' do
  scenario 'while being signed in' do
    sign_in
    click_button 'Sign Out!'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Hi, testemail@example.com'
  end
end
