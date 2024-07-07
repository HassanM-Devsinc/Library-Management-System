require_relative ('file_handling_module')

module SearchBookOrMember
  def check_book_or_member_exists(file)
    book_or_member_info = nil
    
    loop do
      if file == "books_data.txt" || file == "borrowed_book_details.txt"
        print "\n\t\tPlease enter book or author name: "
        input_book_or_author_name = gets.chomp

        if file == "books_data.txt"
          read_file(file) do |book_name, author_name|
            if input_book_or_author_name.downcase == book_name.downcase || input_book_or_author_name.downcase == author_name.chomp.downcase   # comparing if the book or author name exists with our data or not.
              book_or_member_info = { book: book_name, author: author_name}
              break
            end
          end
        end
      end

      if file == "members_data.txt" || file == "borrowed_book_details.txt"
        print "\n\t\tPlease enter member id: "
        input_member_id = gets.chomp.to_i
        
        if file == "members_data.txt"
          read_file(file) do |member_id, member_name|
            if input_member_id == member_id.to_i    # comparing if the input member id exists with our data or not.
              book_or_member_info = { id: member_id, name: member_name}
              break
            end
          end
        end
      end

      if file == "borrowed_book_details.txt"
        if !read_borrowed_book_details_file?(file, input_book_or_author_name, input_member_id)
          return "No record exists"
        else
          return "Book returned successfully."
        end
      end

      if book_or_member_info
        return book_or_member_info
      else
        puts "\n\t\tInvalid input!"
      end
    end
  end

  def read_borrowed_book_details_file?(file, book_data, member_data)
    new_file_name = "temp.txt"
    record_exists = false

    read_file(file) do |member_id, member_name, book_name, author_name|
      borrowed_details = "#{member_id.chomp} - #{member_name.chomp} - #{book_name.chomp} - #{author_name.chomp}"
      
      if ((book_data.downcase == book_name.downcase || book_data.downcase == author_name.chomp.downcase) && member_data.to_i == member_id.to_i)
        record_exists = true
        puts "\n\t\tID: #{member_id}, Member Name: #{member_name}, Book Name: #{book_name}, Author Name: #{author_name}"
        
      else
        if !create_file?(new_file_name, $append_mode, borrowed_details)   # creating a new file and storing borrowed_book_details.txt data into it except the retuning book and member info
          return false
        end
      end
    end
    if File.exists?(file || new_file_name)
      delete_file(file)   # deleting borrowed_book_details.txt file
      rename_file(new_file_name, file)    # renaming temp.txt to borrowed_book_details.txt
    end
    if record_exists == true
      return true
    else
      return false    # incase no record exists
    end   
  end
end