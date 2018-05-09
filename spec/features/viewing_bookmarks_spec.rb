feature 'viewing bookmark' do
  scenario 'page loads correctly' do
    visit '/bookmarks'
    expect(page).to have_css('body')
  end

  scenario 'bookmarks page displays bookmakrs' do
    add_bookmarks

    visit '/bookmarks'

    expect(page).to have_content('http://google.com')
    expect(page).to have_content('http://makersacademy.com')
    expect(page).to have_content('http://destroyallsoftware.com')
  end
end
