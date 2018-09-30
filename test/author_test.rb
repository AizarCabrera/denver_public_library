require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_starts_with_an_empty_array_of_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_add_a_book
    added_book = @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, added_book
    assert_equal "Charlotte", added_book.author_first_name
    assert_equal "Bronte", added_book.author_last_name
    assert_equal "Jane Eyre", added_book.title
    assert_equal "1847", added_book.publication_date
    assert_equal added_book, @charlotte_bronte.books.first
  end

  def test_it_can_add_a_different_book
    added_book = @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    new_added_book = @charlotte_bronte.add_book("Villette", "1853")

    assert_instance_of Book, new_added_book
    assert_equal "Charlotte", new_added_book.author_first_name
    assert_equal "Bronte", new_added_book.author_last_name
    assert_equal "Villette", new_added_book.title
    assert_equal "1853", new_added_book.publication_date
    assert_equal [added_book, new_added_book], @charlotte_bronte.books
  end
end
