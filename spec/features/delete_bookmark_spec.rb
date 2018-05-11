feature 'Deleting a bookmark' do

  let(:bbc_bookmark) { add_bbc_bookmark_using_method }

  scenario 'Delete links visible' do
    bbc_bookmark
    visit '/bookmarks'
    expect(page).to have_button 'delete'
  end

  scenario 'Can click delete link' do
    bbc_bookmark
    visit '/bookmarks'
    click_button("delete-#{bbc_bookmark.id}")
  end

  scenario 'It deletes a bookmark' do
    bbc_bookmark
    visit '/bookmarks'
    click_button("delete-#{bbc_bookmark.id}")
    expect(page).to have_content 'Bookmark deleted.'
  end

end
