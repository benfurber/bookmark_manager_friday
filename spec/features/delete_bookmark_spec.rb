feature 'Deleting a bookmark' do
  let(:bbc_link) { 'http://bbc.co.uk' }
  let(:bbc_name) { 'BBC' }

  scenario 'Delete links visable' do
    add_bookmarks
    visit '/bookmarks'

    expect(page).to have_content 'delete'
  end

  scenario 'Can click delete link and it deletes the bookmark' do
    new_bookmark = Bookmark.add(bbc_name, bbc_link)

    visit '/bookmarks'
    click_link("delete-#{new_bookmark.id}")
  end
end
