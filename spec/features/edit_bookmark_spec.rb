feature 'Can edit a bookmark' do

  let(:bbc_bookmark) { add_bbc_bookmark_using_method }

  scenario 'Edit button visible' do
    bbc_bookmark
    visit '/bookmarks'
    expect(page).to have_button 'Edit'
  end

  scenario 'Can click edit button' do
    bbc_bookmark
    visit '/bookmarks'
    click_button("edit-#{bbc_bookmark.id}")
  end

  scenario 'Goes to edit bookmark page' do
    bbc_bookmark
    visit '/bookmarks'
    click_button("edit-#{bbc_bookmark.id}")
    expect(page).to have_content 'Edit bookmark'
  end

  scenario 'Can edit bookmark' do
    new_bbc_name = 'BBC website'

    bbc_bookmark
    visit '/bookmarks'
    click_button("edit-#{bbc_bookmark.id}")
    fill_in 'title_field', with: new_bbc_name
    fill_in 'url_field', with: 'http://www.bbc.co.uk'
    click_button('Submit bookmark')
    expect(page).to have_content new_bbc_name
  end

end
