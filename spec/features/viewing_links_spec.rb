feature 'Viewing Links' do

  before(:each) do
    Link.create(url: 'http://www.michaellennox.me/', title: 'My Site\'s Home', tags: [Tag.first_or_create(name: 'home')])
    Link.create(url: 'http://www.michaellennox.me/blog', title: 'My Site\'s Blog', tags: [Tag.first_or_create(name: 'blog')])
  end

  scenario 'User can see existing links on links page' do
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content 'My Site'
    end
  end

  scenario 'User can filter links by tags' do
    visit '/tags/blog'
    within 'ul#links' do
      expect(page).to have_content 'My Site\'s Blog'
      expect(page).not_to have_content 'My Site\'s Home'
    end
  end
end
