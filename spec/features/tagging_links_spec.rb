feature 'tagging links' do
  scenario 'adding a single tag to a link' do
    visit('/links/new')
    expect(page.status_code).to eq 200
    fill_in :title, with: 'Google'
    fill_in :tag, with: 'Search'
    fill_in :url, with: 'http://www.google.com/'
    click_button 'Submit'
    expect(current_path).to eq('/links')
    expect(page).to have_content('Tags: Search')
    expect(page).to have_link('Google', href: 'http://www.google.com/')
  end
end
