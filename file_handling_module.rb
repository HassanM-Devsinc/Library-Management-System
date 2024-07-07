module FileHandling
  def read_file(file_name)
    begin
      IO.foreach(file_name) do |data|
        yield data.split(' - ')
      end
    rescue Errno::ENOENT
      puts "\n\t\tFile not found. Please try again!"
    rescue
      puts "\n\t\tError. Please try again!"
    end
  end

  def create_file?(file_name, mode, content)
    begin
      File.open(file_name, mode) do |fo|
        fo.puts content
      end
    rescue
      return false
    else
      return true
    end
  end

  def delete_file(file_name)
    begin
      File.delete(file_name)
    rescue Errno::ENOENT
      puts "\n\t\tFile not found. Please try again!"
    rescue
      puts "\n\t\tError. Please try again!"
    end
  end

  def rename_file(old_file_name, new_file_name)
    begin
      File.rename(old_file_name, new_file_name)
    rescue Errno::ENOENT
      puts "\n\t\tFile not found. Please try again!"
    rescue
      puts "\n\t\tError. Please try again!"
    end
  end
end