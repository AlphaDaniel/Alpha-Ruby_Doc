require 'pry'

# File writer
File.open("favorites.txt", "a") do |l| 
    l.puts "existing"
end

# File reader
favorites = []
File.open("favorites.txt").each do |l| 
  favorites << l.chomp
  favorites
end

# File writer
File.open("favorites.txt", "a") do |l| 
    l.puts "file"
end

binding.pry
