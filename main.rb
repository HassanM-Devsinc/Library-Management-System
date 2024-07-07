require_relative ('library_class')

# global variables
$books_file = "books_data.txt"
$append_mode = "a"

# main
lib = Library.new
lib.welcome_message
lib.manage_menu