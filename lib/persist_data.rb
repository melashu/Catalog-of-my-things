require 'fileutils'
class PersistData
  def initialize
    FileUtils.mkdir_p("#{Dir.pwd}/data")
    @path = "#{Dir.pwd}/data"
  end

  def write_date(file_name, data, msg = '')
    puts msg
    File.write("#{@path}/#{file_name}", "#{data}\n", mode: 'a')
  end

  def read_date(file_name)
    return File.read("#{@path}/#{file_name}").split("\n") if File.size?("#{@path}/#{file_name}")

    []
  end
end
