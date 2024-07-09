require_relative ('book')   
require_relative ('member')

class Library
  def welcome_message
    puts "\n\t*****Welcome To Library Management System*****"
  end

  def display_menu_and_get_choice
    puts "\n\t\t*****************************"
    puts "\t\tPress 1 to list all Books"
    puts "\t\tPress 2 to list all Members"
    puts "\t\tPress 3 to borrow a book"
    puts "\t\tPress 4 to return a book"
    puts "\t\tPress 5 to search a book"
    puts "\t\tPress 6 to exit"
    puts "\t\t*****************************"
    print "\n\t\tPlease enter your choice: "
    choice = gets.chomp.to_i

    return choice
  end

  def manage_menu
    book = Book.new
    member = Member.new("members_data.txt", "borrowed_book_details.txt")

    loop do
      choice = display_menu_and_get_choice

      case choice
      when 1
        book.list_books

      when 2
        member.list_members

      when 3
        member.borrow_book

      when 4
        member.return_book

      when 5
        book.book_search

      when 6
        puts "\n\t\tThanks for visiting."
        break

      else
        puts "\n\t\tInvalid Choice!"
      end
    end
  end
end