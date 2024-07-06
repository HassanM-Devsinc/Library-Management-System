module FileHandling
  def read_file(file_name)
    IO.foreach(file_name) do |data|
      yield data.split(' - ')
    end
  end
end