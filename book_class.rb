require_relative ('file_handling_module')
require_relative ('search_book_module')

class Book
  include FileHandling
  include SearchBook

  def list_books
    puts "\n\t\tOur Books:\n"
    read_file($books_file) do |book_name, author_name|
      puts "\t\tBook: #{book_name}, Author: #{author_name}"
    end
  end

  def book_search
    book_info = check_book_exists
    puts "\n\t\tBook: #{book_info[:book]}, Author: #{book_info[:author]}"
  end
end