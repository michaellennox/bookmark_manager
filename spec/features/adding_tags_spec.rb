feature 'Adding Tags' do
  scenario 'A user can add a tag to a link' do
    visit '/links/new'
    fill_in :title, with: 'My Site\'s Blog'
    fill_in :url, with: 'http://www.michaellennox.me/blog/'
    fill_in :tags, with: 'blog'
    click_button 'Add Link!'
    within 'ul#links' do
      expect(page).to have_content '#blog'
    end
  end
end
