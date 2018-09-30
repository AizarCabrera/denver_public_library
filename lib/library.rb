class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def find_by_author(author_full_name)
    author_hash = {}
    @books.each do |book|
      author_hash[book.title] = book if author_full_name == book.author_full_name
    end
    author_hash
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(book_title)
    @books.any? do |book|
      book.title == book_title
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_publication_date(book_date)
    date_hash = {}
    @books.each do |book|
      if book.publication_date == book_date
        date_hash[book.title]= book
      end
    end
    date_hash
  end
end
