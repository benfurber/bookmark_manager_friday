require 'pg'
require 'uri'

class Bookmark
  if ENV['RACK_ENV'] == 'test'
    database = 'bookmark_manager_test'
  else
    database = 'bookmark_manager'
  end

  @connection = PG.connect( dbname: database)

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |link| Bookmark.new(link['id'], link['title'], link['url']) }
  end

  def self.add(title, url)
    return false unless valid_link_check(url)
    result = @connection.exec("INSERT INTO bookmarks VALUES(DEFAULT, '#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(result.first['id'], result.first['title'], result.first['url'])
  end

  def self.delete(id)
    @connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  private

  def self.valid_link_check(url)
    url =~ URI::regexp
  end
end
