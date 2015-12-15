feature 'Creating tags' do
  scenario 'User can create a single tag when creating their link' do
    visit '/links/new'
    expect(page.status_code).to eq 200
    fill_in :title, with: 'Many Kittens On Google'
    fill_in :tags, with: 'SoFluffy'
    fill_in :url, with: 'http://bit.ly/1YhlvaX'
    click_button 'Submit'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'Many Kittens On Google Tags: SoFluffy'
    end
  end
end
