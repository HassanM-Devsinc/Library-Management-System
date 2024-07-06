require_relative ('file_handling_module')

class Book
  include FileHandling

  def list_books
    puts "\n\t\tOur Books:\n"
    read_file($books_file) do |book_name, author_name|
      puts "\t\tBook: #{book_name}, Author: #{author_name}"
    end
  end
end