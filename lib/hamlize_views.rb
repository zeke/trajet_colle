# To Do
# * Add an option to delete old .erb files
# * Add an option to rename view spec references 
# * Find a way to work around things like > and "

class ToHaml
  def initialize(path)
    @path = path
  end
  
  def convert!
    files = Dir["#{@path}/**/*.erb"]
    puts "No erb files found in directory '#{@path}'" and return if files.empty?
    files.each do |file|
      newfile = file.gsub(/\.erb$/, '.haml')
      puts "#{file} > #{newfile}"
      `html2haml -r #{file} #{newfile}`
    end
  end
end

# path = File.join(File.dirname(__FILE__), '..', 'app', 'views')
path = ARGV.size == 0 ? "." : ARGV.shift
ToHaml.new(path).convert!