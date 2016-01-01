feature 'Creating Links' do
  scenario 'User should be able to create a link' do
    visit '/links/new'
    expect(page.status_code).to eq 200
    fill_in :title, with: 'My Site\'s Blog'
    fill_in :url, with: 'http://www.michaellennox.me/blog/'
    click_button 'Add Link!'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'My Site\'s Blog'
    end
  end
end
