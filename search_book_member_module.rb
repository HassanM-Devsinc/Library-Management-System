require_relative ('file_handling_module')

module SearchBookOrMember
  def check_book_or_member_exists(file)
    book_or_member_info = nil
    
    loop do
      if(file == "books_data.txt" || file == "borrowed_book_details.txt")
        print "\n\t\tPlease enter book or author name: "
        input_book_or_author_name = gets.chomp

        if(file == "books_data.txt") 
          read_file(file) do |book_name, author_name|
            if input_book_or_author_name.downcase == book_name.downcase || input_book_or_author_name.downcase == author_name.chomp.downcase   # comparing if the book or author name exists with our data or not.
              book_or_member_info = { book: book_name, author: author_name}
              break
            end
          end
        end

      elsif(file == "members_data.txt" || file == "borrowed_book_details.txt")
        print "\n\t\tPlease enter member id: "
        input_member_id = gets.chomp.to_i
        
        if(file == "members_data.txt")
          read_file(file) do |member_id, member_name|
            if input_member_id == member_id.to_i    # comparing if the input member id exists with our data or not.
              book_or_member_info = { id: member_id, name: member_name}
              break
            end
          end
        end
      end

      if book_or_member_info
        return book_or_member_info
      else
        puts "\n\t\tInvalid input!"
      end
    end
  end
end