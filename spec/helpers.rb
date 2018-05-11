def add_bookmarks
  connection = PG.connect( dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks VALUES(DEFAULT,'http://makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO bookmarks VALUES(DEFAULT,'http://google.com', 'Google');")
  connection.exec("INSERT INTO bookmarks VALUES(DEFAULT,'http://destroyallsoftware.com', 'Destroy All Software');")
end

def add_bbc_bookmark_using_method
  bbc_link = 'http://bbc.co.uk'
  bbc_name = 'BBC'
  Bookmark.add(bbc_name, bbc_link)
end
