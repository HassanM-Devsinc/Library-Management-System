class Book
    def list_Books
        puts "\n\t\tOur Books:\n"
        IO.foreach("Books.txt"){|data| puts "\t\t#{data}"}
    end
end

class Member
    def list_Members
        puts "\n\t\tOur Members:\n"
        IO.foreach("Members.txt"){|data| puts "\t\t#{data}"}
    end
end


class Library
    def welcomeMessage
        puts "\n\t*****Welcome To Library Management System*****"
    end

    def Menu
        loop do
            puts "\n\t\t*****************************"
            puts "\t\tPress 1 to list all Books"
            puts "\t\tPress 2 to list all Members"
            puts "\t\tPress 3 to borrow a book"
            puts "\t\tPress 4 to return a book"
            puts "\t\tPress 5 to search a book"
            puts "\t\tPress 0 to exit"
            puts "\t\t*****************************"
            print "\n\t\tPlease enter your choice: "
            choice = gets.chomp.to_i

            case choice
            when 1
                book = Book.new
                book.list_Books

            when 2
                member = Member.new
                member.list_Members

            when 3

            when 4

            when 5

            when 0
                puts "\n\t\tThanks for visiting."
                break

            else
                puts "\n\t\tInvalid Choice!"

            end
        end
    end
end

lib = Library.new
lib.welcomeMessage
lib.Menu