require_relative ('file_handling_module')

class Member
  include FileHandling

  def list_members
    puts "\n\t\tOur Members:\n"
    read_file($members_file) do |member_id, member_name|
      puts "\t\tID: #{member_id}, Name: #{member_name}"
    end
  end
end