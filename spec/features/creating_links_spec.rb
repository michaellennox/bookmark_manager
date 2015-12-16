feature 'adding a new link' do

  scenario 'add a link to bookmark manager' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
