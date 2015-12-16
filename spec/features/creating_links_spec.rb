feature 'creating links' do
  scenario 'adding a sites address and title to bookmark manager' do
    visit('/links/new')
    expect(page.status_code).to eq 200
    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com/'
    click_button 'Submit'
    expect(current_path).to eq('/links')
    expect(page).to have_link('Google', href: 'http://www.google.com/')
  end
end
