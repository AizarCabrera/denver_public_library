require './test/test_helper'
require './lib/book'

class BookTest < Minitest::Test
  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  def test_it_exists
    assert_instance_of Book, @book
  end

  def test_it_has_author_first_name
    assert_equal "Harper", @book.author_first_name
  end

  def test_it_has_author_last_name
    assert_equal "Lee", @book.author_last_name
  end

  def test_it_has_author_full_name
    assert_equal "Harper Lee", @book.author_full_name
  end

  def test_it_can_have_a_different_author
    book_with_different_author = Book.new({author_first_name: "Sara", author_last_name: "Maas", title: "Throne of Glass", publication_date: "July 11, 1960"})

    assert_equal "Sara", book_with_different_author.author_first_name
    assert_equal "Maas", book_with_different_author.author_last_name
  end

  def test_it_has_a_title
    assert_equal "To Kill a Mockingbird", @book.title
  end

  def test_it_has_a_publication_date
    assert_equal "1960", @book.publication_date
  end
end
