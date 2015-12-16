feature 'view links' do
  scenario 'should be able to view links from homepage' do
    Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com/')
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
        expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com/')
    end
  end
end
