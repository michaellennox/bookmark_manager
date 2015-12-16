feature 'Filter By Tags' do
  scenario 'I should be able to filter by a specific tag by visiting it\'s page' do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :tag, with: 'Search'
    fill_in :url, with: 'http://www.google.com/'
    click_button 'Submit'
    visit '/links/new'
    fill_in :title, with: 'Another'
    fill_in :tag, with: 'bubbles'
    fill_in :url, with: 'http://www.google.com/bubbles'
    click_button 'Submit'
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200
    expect(page).not_to have_content "Tags: Search"
    expect(page).to have_content "Another Tags: bubbles"
  end
end
