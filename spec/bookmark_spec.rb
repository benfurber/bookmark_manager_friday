require 'bookmark'

describe Bookmark do
  let(:bbc_url) { 'http://bbc.co.uk' }
  let(:bbc_name) { 'BBC' }

  describe '#all' do
    it 'Should return all bookmarks' do
      new_bookmark_1 = Bookmark.add(bbc_name, bbc_url)
      new_bookmark_2 = Bookmark.add('Second website', 'http://secondwebsite.com/')
      new_bookmark_3 = Bookmark.add('Third website', 'http://thirdwebsite.com/')

      the_bookmarks = [
        new_bookmark_1,
        new_bookmark_2,
        new_bookmark_3
      ]

      expect(Bookmark.all).to eq the_bookmarks
    end
  end

  describe '#add' do
    it 'Should add a new bookmark' do
      new_bookmark = Bookmark.add(bbc_name, bbc_url)
      expect(Bookmark.all).to include new_bookmark
    end

    it "Shouldn't add if URL isn't valid" do
      expect(Bookmark.add('fake title', 'fake link')).to eq false
    end
  end

  describe '#==' do

    it 'Two bookmarks with the same content equal each other' do
      bookmark_1 = Bookmark.new(1, bbc_name, bbc_url)
      bookmark_2 = Bookmark.new(1, bbc_name, bbc_url)

      expect(bookmark_1).to eq bookmark_2
    end
  end

  describe '#delete' do
    it "Should remove bookmark" do
      new_bookmark = Bookmark.add(bbc_name, bbc_url)
      bookmark_id = Bookmark.all[0].id
      Bookmark.delete(bookmark_id)
      expect(Bookmark.all).not_to include(new_bookmark)
    end
  end
end
