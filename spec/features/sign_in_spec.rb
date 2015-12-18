feature 'User can sign in' do
  scenario 'A user can sign in' do
    sign_in
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, andy_htun@hotmail.com'
  end
end
