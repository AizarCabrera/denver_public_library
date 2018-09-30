require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    @villette  = @charlotte_bronte.add_book("Villette", "1853")

    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    @dpl = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_can_start_with_empty_array_of_books
    assert_equal [], @dpl.books
  end

  def test_it_can_add_a_book_to_its_colloection_of_books
    @dpl.add_to_collection(@jane_eyre)

    assert_instance_of Array, @dpl.books
    assert_equal @jane_eyre, @dpl.books.first
  end

  def test_it_can_add_more_books_to_its_colloection_of_books
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert_instance_of Array, @dpl.books
    assert_equal [@jane_eyre, @mockingbird, @villette], @dpl.books
  end

  def test_it_can_check_if_book_is_included_in_collection
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert @dpl.include?("To Kill a Mockingbird")
    refute @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_can_alphabetize_by_author_last_name
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    alpha_books = @dpl.card_catalogue

    assert_equal "Bronte", alpha_books.first.author_last_name
    assert_equal "Lee", alpha_books.last.author_last_name
  end

end
