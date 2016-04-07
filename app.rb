#!/usr/bin/env ruby
require_relative 'src/elemental'
require_relative 'src/helpers'


# Initate Application
@app = Elemental.new
@helpers = Helpers.new

# Get File from User input if available
# file_name = ""
ARGV.empty? ? file_name = "" : file_name = File.expand_path(ARGV.shift) 

# If file provided by user, parse, otherwise collect json data from user input
json_data = ""
file_name == "" ? json_data = @app.get_user_input : json_data = @app.get_input_from_file(file_name)
abort "Unable to get JSON data" if json_data == ""
data_set = @app.json_to_hash(json_data)

# Organize JSON data by Type (book,cd,dvd,etc)
clean_inventory = @app.get_clean_inventory(data_set)

# Get data to answer required questions
most_expensive,long_cds,dup_book_cd_authors,names_with_years = @app.parse_data_for_info(clean_inventory)

#  What are the 5 most expensive items from each category?
most_expensive.each do |type,items|
	puts "TYPE: #{type}"
	puts items
end
puts "\n\n"

# Which cds have a total running time longer than 60 minutes?
puts "Checking long CDs"
long_cds.each do |type,items|
	puts items
end
puts "\n\n"

# Which authors have also released cds?
puts "Finding Book Authors that have also released CDs"
dup_book_cd_authors.each do |authors|
	puts "#{authors}"
end
puts "\n\n"

# Get titles chapters and track names that have a year
puts "Finding Titles, Chapters, and Track Names have a Year in them (Year = [12]xxx)"
names_with_years.each do |type,count_hash|
	puts "TYPE: #{type}"
	count_hash.each do |counter,item|
		puts item[1]
	end
end