module FileHandling
  def read_file(file_name)
    IO.foreach(file_name) do |data|
      yield data.split(' - ')
    end
  end

  def create_file(file_name, mode, content)
    File.open(file_name, mode) do |fo|
      fo.puts content
    end
  end

  def delete_file(file_name)
    File.delete(file_name)
  end

  def rename_file(old_file_name, new_file_name)
    File.rename(old_file_name, new_file_name)
  end
end