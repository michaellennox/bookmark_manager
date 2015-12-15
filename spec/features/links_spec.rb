# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature 'links' do
  scenario 'viewing links' do
    Link.create(url: 'google.com', title: 'Google')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
