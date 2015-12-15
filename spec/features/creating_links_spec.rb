feature 'Create a new link' do
  scenario 'user creates a link' do
    visit '/links/new'
    expect(page.status_code).to eq 200
    fill_in :title, with: 'Kittens On Google'
    fill_in :url, with: 'http://bit.ly/1YhlvaX'
    click_button 'Submit'
    visit '/links'
    expect(page).to have_content 'Kittens On Google'
  end
end
