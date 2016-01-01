feature 'Viewing Links' do
  scenario 'User can see existing links on links page' do
    Link.create(url: 'http://www.michaellennox.me/', title: 'My Site')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content 'My Site'
    end
  end
end