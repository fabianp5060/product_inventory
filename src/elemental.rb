require 'json'
require_relative 'helpers'

class Elemental
    def initialize
    	@helpers = Helpers.new
    end

	def get_user_input
		puts "enter json data, enter __END__ when complete"

		final_user_input = ""
		user_input = ""
	    until user_input == "__END__" 
		    final_user_input += user_input	
		    user_input = gets.chomp
		end
		return final_user_input
	end

	def get_input_from_file(file_name)
		abort "Could not locate file: #{file_name}" unless File.exists?(file_name)
		file_input = File.read(file_name)

		return file_input
	end

	# Convert JSON data to HASH
	def json_to_hash(json_data)
		return JSON.parse(json_data, :symbolize_names => true)	
	end

	# Use Type element as hash key
	# hash[type] = Array(item)
	def get_clean_inventory(data_set)
		clean_inventory = @helpers.make_hoa

		data_set.each do |item_info|
			if item_info.has_key?(:type)
				item_type = item_info.delete(:type)
				clean_inventory[item_type].push(item_info)
			else
				puts "Skipping, invalid item, missing type"
			end
		end

		return clean_inventory
	end

	def parse_data_for_info(clean_inventory)
		most_expensive = Hash.new
		long_cds = @helpers.make_hoa
		book_cd_authors = @helpers.make_hoh

		counter,found_data,regx_search,search_info,names_with_years = setup_search_for_value(clean_inventory.keys)


		clean_inventory.each do |type,inventory|
			most_expensive = get_most_expensive(type,inventory,most_expensive)
			long_cds = get_long_cds(type,inventory,long_cds) if type == "cd"
			book_cd_authors = get_book_cd_authors(type,inventory,book_cd_authors) unless type == "dvd"
			names_with_years = search_for_value(counter,inventory,found_data,regx_search,search_info,type,type)
		end
		dup_book_cd_authors = get_dup_auths(book_cd_authors)

		return most_expensive,long_cds,dup_book_cd_authors,names_with_years
	end

	def setup_search_for_value(inv_keys)
		regx_search = Regexp.new('[12]\d\d\d')
		search_info = {
			search_keys: ['title','name','chapters'],
			types: inv_keys
		}
		found_data = @helpers.make_hohoa
		returned_hash = nil
		counter = 0
		names_with_years = nil	

		return counter,found_data,regx_search,search_info,names_with_years
	end


	# Get Top five most expensive items for each inventory type (Ordered by most expensive)
	# Return Hash of Arrays | hash[type] = Array(<top 5 items>)
	def get_most_expensive(type,inventory,most_expensive)
		most_expensive[type] = Array.new
		ordered_list = inventory.sort {|x,y| y[:price] <=> x[:price] }
		ordered_list[0..4].each do |item|
			most_expensive[type].push(item)
		end

		return most_expensive
	end

	# Get any cd's where the sum of the track play times is > 60
	# Return Hash of Array | hash[type] = Array(<items > 60 min play time>)
	def get_long_cds(type,inventory,long_cds)
		inventory.each do |item|
			total_track_time = 0
			item[:tracks].each do |track|
				total_track_time += track[:seconds]
			end
			if total_track_time/60 > 60
				item[:total_time] = total_track_time/60
				long_cds[type].push(item) 
			end
		end
		return long_cds
	end

	# Get all authors who have created both books and CDs
	# Return Array | array = [<rows of author_names>]
	def get_book_cd_authors(type,inventory,book_cd_authors)
		inventory.each { |item| book_cd_authors[type][item[:author]] = nil }
		return book_cd_authors
	end

	def get_dup_auths(book_cd_authors)
		result = Array.new
		book_cd_authors["cd"].each do |auth_name,_|
			if book_cd_authors["book"].has_key?(auth_name)
				result.push(auth_name)
				book_cd_authors["cd"].delete(auth_name)
			end
		end
		puts "My RESULT: #{result}"
		return result
	end


	# Get list of all items that contain a year in the Title, Track_Name, or Chapter_Name
	# Year is any 4 digit number that starts with 1 or 2 (IE 1000 -> 2999)
	# Return Hash of Hash of Array of Arrays | hash[type][matching_row_num] = [true,<item>]
	def search_for_value(counter,data_set,found_data,regx_search,search_info,type,key)
		if data_set.is_a?(Hash)
			data_set.each { |k,v| found_data = search_for_value(counter,v,found_data,regx_search,search_info,type,k) }
		elsif data_set.is_a?(Array)
			data_set.each do |v|
				found_data[key][counter] = [nil,v] if search_info[:types].include?(key)
				found_data = search_for_value(counter,v,found_data,regx_search,search_info,type,key)		
				
				if search_info[:types].include?(key)
					if found_data[key].has_key?(counter)
						if found_data[type][counter][0] == false
							found_data[key].delete(counter)
						end
					end
					counter += 1 
				end						
			end
		else
			if data_set.to_s.match(regx_search)
				if search_info[:search_keys].include?(key.to_s)
					found_data[type][counter][0] = true
				else
					found_data[type][counter][0] = false unless found_data[type][counter][0] == true
				end
			end

		end
		return found_data
	end
end