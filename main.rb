require_relative ('library_class')

# global variables
$books_file = "books_data.txt"
$members_file = "members_data.txt"
$borrowed_book_details_file = "borrowed_book_details.txt"
$append_mode = "a"

# main
lib = Library.new
lib.welcome_message
lib.manage_menu