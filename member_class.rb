require_relative ('file_handling_module')
require_relative ('search_book_module')

class Member
  include FileHandling
  include SearchBook

  def list_members
    puts "\n\t\tOur Members:\n"
    read_file($members_file) do |member_id, member_name|
      puts "\t\tID: #{member_id.to_i}, Name: #{member_name}"
    end
  end

  def borrow_book
    member_info = check_member_exists
    puts "\n\t\tID: #{member_info[:id]}, Name: #{member_info[:name]}"
    book_info = check_book_exists
    puts "\n\t\tBook: #{book_info[:book]}, Author: #{book_info[:author]}"

    if book_already_borrowed?(book_info[:book], book_info[:author])
      puts "\n\t\tSorry, this book is already borrowed."
      return
    end

    save_borrowed_book_and_member_data(member_info[:id], member_info[:name], book_info[:book], book_info[:author])
  end

  def check_member_exists
    member_info = nil

    loop do
      print "\n\t\tPlease enter member id: "
      input_member_id = gets.chomp.to_i

      read_file($members_file) do |member_id, member_name|
        if input_member_id == member_id.to_i    # comparing if the input member id exists with our data or not.
          member_exist = true
          member_info = { id: member_id, name: member_name}
          break
        end
      end

      if member_info
        return member_info
      else
        puts "\n\t\tInvalid ID!"
      end
    end
  end

  def book_already_borrowed?(book_name, author_name)
    if File.exists?($borrowed_book_details_file)
      read_file($borrowed_book_details_file) do |member_id, member_name, book_namee, author_namee|
        if book_name == book_namee && author_name.chomp == author_namee.chomp 
          return true
        end
      end
    end
    return false
  end

  def save_borrowed_book_and_member_data(member_id, member_name, book_name, author_name)
    borrowed_details = "#{member_id.chomp} - #{member_name.chomp} - #{book_name.chomp} - #{author_name.chomp}"
    if create_file?($borrowed_book_details_file, $append_mode, borrowed_details)
      puts "\n\t\tBorrowed book data saved successfully."
    else
      puts "\n\t\tError. Please try again!"
    end
  end
end