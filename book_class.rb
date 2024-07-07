require_relative ('file_handling_module')
require_relative ('search_book_member_module')

class Book
  include FileHandling
  include SearchBookOrMember

  def list_books
    puts "\n\t\tOur Books:\n"
    read_file($books_file) do |book_name, author_name|
      puts "\t\tBook: #{book_name}, Author: #{author_name}"
    end
  end

  def book_search
    book_info = check_book_or_member_exists($books_file)
    puts "\n\t\tBook: #{book_info[:book]}, Author: #{book_info[:author]}"
  end
end