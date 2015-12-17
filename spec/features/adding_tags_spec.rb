feature 'adding a tag' do

  scenario 'add a tag to a link' do
    visit 'links/new'
    fill_in 'url', with: 'http://www.telva.com'
    fill_in 'title', with: 'Telva'
    fill_in 'tags', with: 'Fashion'

    click_button 'Create link'
    link = Link.first
      expect(link.tags.map(&:name)).to include 'Fashion'
  end

end
