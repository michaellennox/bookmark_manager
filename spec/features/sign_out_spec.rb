feature 'Signing out' do
  scenario 'user should be able to sign out' do
    sign_in
    sign_out
    expect(current_path).to eq '/links'
    expect(page).not_to have_content 'Welcome, andy_htun@hotmail.com'
    expect(page).to have_content 'Goodbye, andy_htun@hotmail.com'
  end
end
