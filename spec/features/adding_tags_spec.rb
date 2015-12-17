feature 'adding a tag' do

  scenario 'add a tag to a link' do
    visit 'links/new'
    fill_in 'url', with: 'http://www.telva.com'
    fill_in 'title', with: 'Telva'
    fill_in 'tags', with: 'fashion'

    click_button 'Create link'
    link = Link.first
      expect(link.tags.map(&:name)).to include 'fashion'
  end

  scenario 'adding and displaying multiple tags' do
    visit 'links/new'
    fill_in :url, with: 'http://www.google.com/kittens'
    fill_in :title, with: 'Where to find kittens'
    fill_in :tags, with: 'small, fluffy, warm, kittens, animals'

    click_button 'Create link'
    expect(current_path).to eq '/links'

    expect(page).to have_content 'Tags: #small #fluffy #warm #kittens #animals'
  end

end
