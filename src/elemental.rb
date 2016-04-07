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

	def get_most_expensive(clean_inventory)
		result = Hash.new
		clean_inventory.each do |type,inventory|
			result[type] = Array.new
			ordered_list = inventory.sort {|x,y| y[:price] <=> x[:price] }
			ordered_list[0..4].each do |item|
				result[type].push(item)
			end
		end
		return result
	end

	def get_long_cds(clean_inventory)
		result = @helpers.make_hoa
		cd_lenght = Hash.new
		clean_inventory.each do |type,inventory|
			if type == "cd"
				inventory.each do |item|
					total_track_time = 0
					item[:tracks].each do |track|
						total_track_time += track[:seconds]
					end
					if total_track_time/60 > 60
						item[:total_time] = total_track_time/60
						result[type].push(item) 
					end
				end
			end
		end
		return result
	end

	def get_dup_auths(clean_inventory)
		result = Array.new
		book_inv = Hash.new
		cd_inv = Hash.new
		clean_inventory.each do |type,inventory|
			if type == "book" || type == "cd"
				inventory.each do |item|
					book_inv[item[:author]] = nil if type == "book"
					cd_inv[item[:author]] = nil if type == "cd"
				end
			end
		end
		book_inv.each do |k,_|
			if cd_inv.has_key?(k)
				result.push(k)
				cd_inv.delete(k)
			end
		end
		return result
	end

	# def get_items_with_year(clean_inventory)
	# 	result = @helpers.make_hoa
		
	# 	year_info = @helpers.make_hoa	
	# 	clean_inventory.each do |type,inventory|
	# 		inventory.each do |item|
	# 		year_info[type].push(item) if item.has_key?(:title) && item[:title] =~ /[12]\d\d\d/
	# 		year_info[type].push(item) if item.has_key?(:chapters) && item[:chapters] =~ /[12]\d\d\d/
	# 		year_info[type].push(item) if item.has_key?(:track)

					
	# 	end
	# end

	def search_for_value(counter,data_set,found_data,regx_search,search_info,type,key)
		# puts "ENTERING SEARCH_FOR_VALUE\n  TYPE: #{type}\n  COUNTER: #{counter}\n  KEY: #{key}\n  INVENTORY/DATASET: #{data_set}\n  FOUND DATA: #{found_data}"
		# puts "====="
		if data_set.is_a?(Hash)
			data_set.each do |k,v|
				# puts "Parsing Hash with K #{k} and value: #{v}\n---------------"
				found_data = search_for_value(counter,v,found_data,regx_search,search_info,type,k)
			end
		elsif data_set.is_a?(Array)
			data_set.each do |v|
				# puts "Parsing Array formerly with K #{key} and value: #{v}\n---------------"	
				found_data[key][counter] = [nil,v] if search_info[:types].include?(key)
			
				found_data = search_for_value(counter,v,found_data,regx_search,search_info,type,key)		
				
				# puts "if key = type? (#{key})"
				if search_info[:types].include?(key)
					# puts "Setting interesting value to nil<<<<<<++++++++_______++++===="

					# puts "Checking if counter (#{counter}) is in hash? #{found_data[key].has_key?(counter)}"
					if found_data[key].has_key?(counter)
						# puts "Is #{found_data[key][counter]}\n==> interesting? #{found_data[key][counter][0]}"
						if found_data[type][counter][0] == false
							# puts "DELETING Line: at: #{counter} (#{found_data[key][counter]})" 
							found_data[key].delete(counter)
						end
					end
					counter += 1 
				end						
			end
		else
			# puts "Parsing value: #{data_set} former K #{key}"
			if data_set.to_s.match(regx_search)
				# puts "Found Matching Value for #{data_set}"
				# puts "DOES K (#{key} exist in #{search_info[:search_keys]}: (#{search_info[:search_keys].include?(key.to_s)})"
				if search_info[:search_keys].include?(key.to_s)
					found_data[type][counter][0] = true
					# puts "Found Value that we care about K: #{key}: (#{data_set}) for counter: #{counter} and is interesting? #{found_data[type][counter][0]}" 
				else
					found_data[type][counter][0] = false unless found_data[type][counter][0] == true
					# puts "Setting interesting value to false (IN ELSE STATEMENT)<<<<<<++++++++_______++++===="

				end
			end

		end
		return found_data
	end
end