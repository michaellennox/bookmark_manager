feature 'save a website' do
  # scenario 'add a website to the bookmark manager' do
  #   visit '/links'
  #   Link.create(url: "https://www.yahoo.com", title: "Yahoo")
  #   expect(page.status_code).to eq 200
  #   within 'ul#links' do
  #     expect(page).to have_content('Yahoo')
  #   end
  #   end
  scenario 'add a website to the bookmark manager' do
    visit '/links/add'
    fill_in(:url, with: 'google.com')
    fill_in(:title, with: 'live')
    click_button('Add link')
    expect(current_path).to eq('/links')
    within 'ul#links' do
        expect(page).to have_content('live')
      end
    end
  end
