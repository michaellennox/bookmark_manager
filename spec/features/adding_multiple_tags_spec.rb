feature 'adding more than one tag' do
  scenario 'more than one tag is added for a link' do
    visit('/links/new')
    expect(page.status_code).to eq 200
    fill_in :title, with: 'Google'
    fill_in :tag, with: 'Search, Find, Email'
    fill_in :url, with: 'http://www.google.com/'
    click_button 'Submit'
    expect(current_path).to eq('/links')
    expect(page).to have_content('Tags: Search Find Email')
    expect(page).to have_link('Google', href: 'http://www.google.com/')
  end  
end
