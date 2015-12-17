feature 'filtering tags' do

  scenario 'filter links by tag name' do
    visit 'links/new'
    fill_in 'url', with: 'http://www.telva.com'
    fill_in 'title', with: 'Telva'
    fill_in 'tags', with: 'fashion'

    click_button 'Create link'

    visit 'links/new'
    fill_in 'url', with: 'http://www.elmundo.com'
    fill_in 'title', with: 'Mundo'
    fill_in 'tags', with: 'bubbles'

    click_button 'Create link'

    visit '/tags/bubbles'
      expect(page).not_to have_content 'fashion'
      expect(page).to have_content 'bubbles'
    end

  end
