require_relative ('library_class')

# global variables
$books_file = "books_data.txt"
$members_file = "members_data.txt"

# main
lib = Library.new
lib.welcome_message
lib.manage_menu