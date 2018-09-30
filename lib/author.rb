class Author
  attr_reader :books, :first_name, :last_name

  def initialize(author_data)
    @first_name = author_data[:first_name]
    @last_name = author_data[:last_name]
    @books = []
  end

  def add_book(book_title, book_date)
    book = Book.new({author_first_name: first_name,
                     author_last_name: last_name,
                     title: book_title,
                     publication_date: book_date})
    @books << book
    book
  end
end
