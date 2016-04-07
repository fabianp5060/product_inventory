require 'minitest/autorun'
require_relative '../src/elemental'
require_relative 'mockApp'

class TestElemental < Minitest::Test

	def setup
		@app = Elemental.new
		@mock = MockApp.new
	end

	# def test_json_to_hash
	# 	expected_hash = @mock.mock_json_to_hash
	# 	returned_hash = @app.json_to_hash(File.expand_path('test_data.json'))

	# 	assert_equal returned_hash,expected_hash,"#{__method__}: Failed to import json data into mathcing hash"

	# end

	def test_5_most_expensive_items_from_each_category
		expected_hash = @mock.mock_5_most_expensive_items_from_each_category

		returned_hash = Hash.new
		@mock.mock_hash.each { |type,inventory| returned_hash = @app.get_most_expensive(type,inventory,returned_hash) }
		assert_equal expected_hash, returned_hash,"#{__method__}: Failed to find 5 most expensive items from each category"

		assert_equal 5,expected_hash["book"].length,"#{__method__}: Failed to return 5 results"
	end

	def test_which_cds_have_a_total_running_time_longer_than_60_minutes
		expected_hash = @mock.mock_which_cds_have_a_total_running_time_longer_than_60_minutes

		returned_hash = Hash.new do |k1,v1|
            k1[v1] = Array.new
        end

		@mock.mock_hash.each {|type,inventory| returned_hash = @app.get_long_cds(type,inventory,returned_hash) }

		assert_equal expected_hash,returned_hash,"#{__method__}: Failed to find matching results"
	end

	def test_which_authors_have_also_released_cds
		expected_list = @mock.mock_which_authors_have_also_released_cds

		book_cd_authors = Hash.new do |k1,v1|
            k1[v1] = Hash.new
        end

		@mock.mock_hash.each { |type,inventory| book_cd_authors = @app.get_book_cd_authors(type,inventory,book_cd_authors) }
		returned_list = @app.get_dup_auths(book_cd_authors)

		assert_equal expected_list,returned_list,"#{__method__}: Failed to find matching authors"
	end

	def test_which_items_have_a_title_track_or_chapter_that_contains_a_year
		expected_result = @mock.mock_which_items_have_a_title_track_or_chapter_that_contains_a_year
		# returned_list = @app.get_items_with_year(@mock.mock_hash)

	end

	def test_search_for_value
		search = Regexp.new('[12]\d\d\d')

		assert "1000".match(search), "Expected to find matching regex"
		assert "2000".match(search), "Expected to find matching regex"
		assert_nil "3000".match(search), "Not expected to find matching regex"
		assert_nil "100".match(search), "Not expected to find matching regex"

		found_values = Hash.new do |k1,v1|
            k1[v1] = Hash.new do |k2,v2|
                k2[v2] = Array.new
            end
        end

        mock_data,expected_result = @mock.mock_search_for_values
        search_info = {
        	search_keys: ['title','name','chapters'],
        	types: mock_data.keys
        }
	    returned_hash = nil
        counter = 0

		mock_data.each do |type,inventory|        
			returned_hash = @app.search_for_value(counter,inventory,found_values,search,search_info,type,type)
		end

		# puts "FOUND THE FOLLOWING DATA THAT I CARE ABOUT: "
		# returned_hash.each do |type,inventory|
		# 	puts "TYPE: #{type}"
		# 	inventory.each do |x,item|
		# 		puts "#{x}: #{item}"
		# 	end
		# end

		assert_equal expected_result,returned_hash,"#{__method__}: Did not get titles,Tracks,or Chapters with Year in them"
	end
end
