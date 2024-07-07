require_relative ('file_handling_module')

module SearchBook
  def check_book_exists
    book_info = nil

    loop do
      print "\n\t\tPlease enter book or author name: "    # Since member exists, now asking for book or author name.
      input_book_or_author_name = gets.chomp
      
      read_file($books_file) do |book_name, author_name|
        if input_book_or_author_name == book_name || input_book_or_author_name == author_name.chomp   # comparing if the book or author name exists with our data or not.
          book_exist = true
          book_info = { book: book_name, author: author_name}
          break
        end
      end

      if book_info
        return book_info
      else
        puts "\n\t\tInvalid Book OR Author name!"
      end
    end
  end
end