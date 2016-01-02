feature 'Signing In' do
  scenario 'user can sign in' do
    sign_in
    expect(page).to have_content 'Hi, testemail@example.com'
  end
end
