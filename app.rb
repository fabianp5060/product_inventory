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


clean_inventory = @app.get_clean_inventory(data_set)

#  What are the 5 most expensive items from each category?
top_five = @app.get_most_expensive(clean_inventory)
top_five.each do |type,items|
	puts "TYPE: #{type}"
	puts items
end
puts "\n\n"

# Which cds have a total running time longer than 60 minutes?
long_cds = @app.get_long_cds(clean_inventory)
puts "Checking long CDs"
long_cds.each do |type,items|
	puts items
end
puts "\n\n"


# Which authors have also released cds?
dup_auths = @app.get_dup_auths(clean_inventory)
puts "Finding Book Authors that have also released CDs"
dup_auths.each do |auth|
	puts auth
end
puts "\n\n"

# Which Titles, Chapters, and Track Names have a Year in them (Year = [12]xxx)
search = Regexp.new('[12]\d\d\d')
search_info = {
	search_keys: ['title','name','chapters'],
	types: clean_inventory.keys
}
found_values = @helpers.make_hohoa
returned_hash = nil
counter = 0
names_with_years = nil

clean_inventory.each do |type,inventory|        
	names_with_years = @app.search_for_value(counter,inventory,found_values,search,search_info,type,type)
end

puts "Finding Titles, Chapters, and Track Names have a Year in them (Year = [12]xxx)"
names_with_years.each do |type,count_hash|
	puts "TYPE: #{type}"
	count_hash.each do |counter,item|
		puts item[1]
	end
end



