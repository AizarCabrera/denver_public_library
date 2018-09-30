class Book
  attr_reader :author_first_name, :author_last_name, :title, :publication_date

  def initialize(book_data)
    @author_first_name  = book_data[:author_first_name]
    @author_last_name   = book_data[:author_last_name]
    @title              = book_data[:title]
    @publication_date   = book_data[:publication_date].split(", ").last
  end
end
