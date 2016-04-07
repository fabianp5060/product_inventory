class MockApp

	def mock_hash
		expected_result = {
			"dvd"=>[
				{:director=>"Arthur Lee", :title=>"ac lobortis", :year=>1941, :minutes=>128, :price=>13.76}, 
				{:director=>"Jacqueline Thompson", :title=>"primis in faucibus orci", :year=>1926, :minutes=>135, :price=>1.40}, 
				{:director=>"Linda Wood", :title=>"libero non", :year=>1961, :minutes=>99, :price=>24.08}, 
				{:director=>"Jennifer Porter", :title=>"ante vestibulum ante ipsum", :year=>1932, :minutes=>108, :price=>34.72}, 
				{:director=>"Jack Gonzales", :title=>"sapien dignissim", :year=>2008, :minutes=>109, :price=>6.35}, 
				{:director=>"Jessica Stewart", :title=>"luctus et", :year=>1978, :minutes=>139, :price=>29.78}
			], 
			"cd"=>[
				{:author=>"Katherine Cunningham", :title=>"eros vestibulum ac est", :year=>1961, :tracks=>[{:seconds=>132, :name=>"five"}, {:seconds=>110, :name=>"four"}], :price=>29.88}, 
				{:author=>"Irene Castillo", :title=>"orci luctus et ultrices", :year=>1929, :tracks=>[{:seconds=>310, :name=>"four"}, {:seconds=>236, :name=>"three"}], :price=>18.29}, 
				{:author=>"Louis Mitchell", :title=>"suspendisse potenti nullam porttitor", :year=>1951, :tracks=>[{:seconds=>218, :name=>"three"}, {:seconds=>161, :name=>"five"}, {:seconds=>356, :name=>"one"}, {:seconds=>178, :name=>"one"}], :price=>38.48}, 
				{:author=>"John Mason", :title=>"volutpat in congue etiam", :year=>1990, :tracks=>[{:seconds=>328, :name=>"one"}, {:seconds=>131, :name=>"two"}], :price=>1.30}, 
				{:author=>"Jacqueline Spencer", :title=>"quam turpis adipiscing lorem", :year=>1992, :tracks=>[{:seconds=>159, :name=>"one"}, {:seconds=>3600, :name=>"three"}], :price=>27.40}, 
				{:author=>"Jean Armstrong", :title=>"donec vitae nisi nam", :year=>1920, :tracks=>[{:seconds=>136, :name=>"one"}], :price=>4.83},	
				{:author=>"Philip Reynolds", :title=>"ut nunc vestibulum", :year=>1968, :tracks=>[{:seconds=>331, :name=>"four"}, {:seconds=>263, :name=>"four"}, {:seconds=>248, :name=>"two"}, {:seconds=>131, :name=>"one"}], :price=>7.92}							
			], 
			"book"=>[
				{:author=>"Martha Bryant", :title=>"quam pede lobortis", :year=>2000, :chapters=>["elementum", "congue", "ipsum", "consectetuer", "eu", "consectetuer"], :price=>21.34}, 
				{:author=>"Dorothy Howard", :title=>"eleifend luctus ultricies eu", :year=>1949, :chapters=>["aliquet", "justo", "metus", "hac", "ligula", "eu"], :price=>20.88}, 
				{:author=>"Gerald Wells", :title=>"mi sit amet", :year=>2006, :chapters=>["porta", "luctus", "sapien"], :price=>26.31}, 
				{:author=>"Earl Stephens", :title=>"vitae nisi nam ultrices", :year=>1944, :chapters=>["velit", "blandit", "in", "semper"], :price=>38.39}, 
				{:author=>"Tina Allen", :title=>"imperdiet sapien", :year=>1997, :chapters=>["habitasse", "neque", "velit", "mi"], :price=>37.84}, 
				{:author=>"Jean Armstrong", :title=>"morbi a ipsum", :year=>1959, :chapters=>["lacinia", "maecenas", "sollicitudin", "id", "hac"], :price=>27.49},
				{:author=>"Philip Reynolds", :title=>"felis eu", :year=>1901, :chapters=>["ut", "quam", "rutrum", "morbi"], :price=>15.59}				
			]
		}

		return expected_result
	end

	def mock_5_most_expensive_items_from_each_category
		expected_result = {
			"dvd"=>[
				{:director=>"Jennifer Porter", :title=>"ante vestibulum ante ipsum", :year=>1932, :minutes=>108, :price=>34.72}, 
				{:director=>"Jessica Stewart", :title=>"luctus et", :year=>1978, :minutes=>139, :price=>29.78}, 
				{:director=>"Linda Wood", :title=>"libero non", :year=>1961, :minutes=>99, :price=>24.08}, 
				{:director=>"Arthur Lee", :title=>"ac lobortis", :year=>1941, :minutes=>128, :price=>13.76}, 
				{:director=>"Jack Gonzales", :title=>"sapien dignissim", :year=>2008, :minutes=>109, :price=>6.35}
			], 
			"cd"=>[
				{:author=>"Louis Mitchell", :title=>"suspendisse potenti nullam porttitor", :year=>1951, :tracks=>[{:seconds=>218, :name=>"three"}, {:seconds=>161, :name=>"five"}, {:seconds=>356, :name=>"one"}, {:seconds=>178, :name=>"one"}], :price=>38.48}, 
				{:author=>"Katherine Cunningham", :title=>"eros vestibulum ac est", :year=>1961, :tracks=>[{:seconds=>132, :name=>"five"}, {:seconds=>110, :name=>"four"}], :price=>29.88}, 
				{:author=>"Jacqueline Spencer", :title=>"quam turpis adipiscing lorem", :year=>1992, :tracks=>[{:seconds=>159, :name=>"one"}, {:seconds=>3600, :name=>"three"}], :price=>27.4}, 
				{:author=>"Irene Castillo", :title=>"orci luctus et ultrices", :year=>1929, :tracks=>[{:seconds=>310, :name=>"four"}, {:seconds=>236, :name=>"three"}], :price=>18.29}, 
				{:author=>"Philip Reynolds", :title=>"ut nunc vestibulum", :year=>1968, :tracks=>[{:seconds=>331, :name=>"four"}, {:seconds=>263, :name=>"four"}, {:seconds=>248, :name=>"two"}, {:seconds=>131, :name=>"one"}], :price=>7.92}, 
			],				
			"book"=>[
				{:author=>"Earl Stephens", :title=>"vitae nisi nam ultrices", :year=>1944, :chapters=>["velit", "blandit", "in", "semper"], :price=>38.39}, 
				{:author=>"Tina Allen", :title=>"imperdiet sapien", :year=>1997, :chapters=>["habitasse", "neque", "velit", "mi"], :price=>37.84}, 
				{:author=>"Jean Armstrong", :title=>"morbi a ipsum", :year=>1959, :chapters=>["lacinia", "maecenas", "sollicitudin", "id", "hac"], :price=>27.49}, 
				{:author=>"Gerald Wells", :title=>"mi sit amet", :year=>2006, :chapters=>["porta", "luctus", "sapien"], :price=>26.31}, 
				{:author=>"Martha Bryant", :title=>"quam pede lobortis", :year=>2000, :chapters=>["elementum", "congue", "ipsum", "consectetuer", "eu", "consectetuer"], :price=>21.34}
			]
		}

	    return expected_result
	end

	def mock_which_cds_have_a_total_running_time_longer_than_60_minutes
		expected_result = {
			"cd"=>[
				{:author=>"Jacqueline Spencer", :title=>"quam turpis adipiscing lorem", :year=>1992, :tracks=>[{:seconds=>159, :name=>"one"}, {:seconds=>3600, :name=>"three"}], :price=>27.4, :total_time=>62}
			]
		}

		return expected_result
	end

	def mock_which_authors_have_also_released_cds
		expected_result = [
			"Jean Armstrong",
			"Philip Reynolds"
		]

		return expected_result
	end

	def mock_which_items_have_a_title_track_or_chapter_that_contains_a_year
	
	end

	def mock_search_for_values
		mock_data = {
			"dvd"=>[
				{:director=>"Arthur Lee", :title=>"2000 ac lobortis", :year=>1941, :minutes=>128, :price=>13.76}, 
				{:director=>"Jacqueline Thompson", :title=>"primis in faucibus orci", :year=>1926, :minutes=>135, :price=>1.40}, 
				{:director=>"Linda Wood", :title=>"libero non", :year=>1961, :minutes=>99, :price=>24.08}, 
				{:director=>"Jennifer Porter", :title=>"ante vestibulum ante ipsum", :year=>1932, :minutes=>108, :price=>34.72}, 
				{:director=>"Jack Gonzales", :title=>"sapien dignissim1000", :year=>2008, :minutes=>109, :price=>6.35}, 
				{:director=>"Jessica Stewart", :title=>"luctus2000et", :year=>1978, :minutes=>139, :price=>29.78}
			], 
			"cd"=>[
				{:author=>"Katherine Cunningham", :title=>"eros vestibulum ac est", :year=>1961, :tracks=>[{:seconds=>132, :name=>"five2001"}, {:seconds=>110, :name=>"four"}], :price=>29.88}, 
			# 	{:author=>"Irene Castillo", :title=>"orci luctus et ultrices", :year=>1929, :tracks=>[{:seconds=>310, :name=>"four"}, {:seconds=>236, :name=>"three"}], :price=>18.29}, 
			# 	{:author=>"Louis Mitchell", :title=>"suspendisse potenti nullam porttitor", :year=>1951, :tracks=>[{:seconds=>218, :name=>"three"}, {:seconds=>161, :name=>"five"}, {:seconds=>356, :name=>"one"}, {:seconds=>178, :name=>"one"}], :price=>38.48}, 
			# 	{:author=>"John Mason", :title=>"volutpat in congue etiam", :year=>1990, :tracks=>[{:seconds=>328, :name=>"one"}, {:seconds=>131, :name=>"two"}], :price=>1.30}, 
			# 	{:author=>"Jacqueline Spencer", :title=>"quam turpis adipiscing lorem", :year=>1992, :tracks=>[{:seconds=>159, :name=>"one"}, {:seconds=>3600, :name=>"three"}], :price=>27.40}, 
				{:author=>"Jean Armstrong", :title=>"donec vitae nisi nam", :year=>1920, :tracks=>[{:seconds=>136, :name=>"one"}], :price=>4.83},	
				{:author=>"Philip Reynolds", :title=>"2002ut nunc vestibulum", :year=>1968, :tracks=>[{:seconds=>331, :name=>"four"}, {:seconds=>263, :name=>"four"}, {:seconds=>248, :name=>"two"}, {:seconds=>131, :name=>"one"}], :price=>7.92}							
			], 
			"book"=>[
				{:author=>"Martha Bryant", :title=>"quam pede lobortis", :year=>2000, :chapters=>["elementum2003", "congue", "ipsum", "consectetuer", "eu", "consectetuer"], :price=>21.34}, 
				{:author=>"Dorothy Howard", :title=>"eleifend luctus ultricies eu", :year=>1949, :chapters=>["aliquet", "justo", "metus", "hac", "ligula", "eu"], :price=>20.88}, 
				{:author=>"Gerald Wells", :title=>"mi sit amet", :year=>2006, :chapters=>["porta", "luctus", "sapien"], :price=>26.31}, 
				{:author=>"Earl Stephens", :title=>"vitae nisi nam ultrices", :year=>1944, :chapters=>["velit", "blandit", "in", "semper"], :price=>38.39}, 
				{:author=>"Tina Allen", :title=>"imperdiet sapien", :year=>1997, :chapters=>["habitasse", "neque", "velit", "mi"], :price=>37.84}, 
				{:author=>"Jean Armstrong", :title=>"morbi a ipsum", :year=>1959, :chapters=>["lacinia", "maecenas", "sollicitudin", "id", "hac"], :price=>27.49},
				{:author=>"Philip Reynolds", :title=>"felis eu2004", :year=>1901, :chapters=>["ut", "quam", "rutrum", "morbi"], :price=>15.59}				
			]
		}	

		expected_result = {"dvd"=>{0=>[true, {:director=>"Arthur Lee", :title=>"2000 ac lobortis", :year=>1941, :minutes=>128, :price=>13.76}], 4=>[true, {:director=>"Jack Gonzales", :title=>"sapien dignissim1000", :year=>2008, :minutes=>109, :price=>6.35}], 5=>[true, {:director=>"Jessica Stewart", :title=>"luctus2000et", :year=>1978, :minutes=>139, :price=>29.78}]}, "cd"=>{0=>[true, {:author=>"Katherine Cunningham", :title=>"eros vestibulum ac est", :year=>1961, :tracks=>[{:seconds=>132, :name=>"five2001"}, {:seconds=>110, :name=>"four"}], :price=>29.88}], 2=>[true, {:author=>"Philip Reynolds", :title=>"2002ut nunc vestibulum", :year=>1968, :tracks=>[{:seconds=>331, :name=>"four"}, {:seconds=>263, :name=>"four"}, {:seconds=>248, :name=>"two"}, {:seconds=>131, :name=>"one"}], :price=>7.92}]}, "book"=>{0=>[true, {:author=>"Martha Bryant", :title=>"quam pede lobortis", :year=>2000, :chapters=>["elementum2003", "congue", "ipsum", "consectetuer", "eu", "consectetuer"], :price=>21.34}], 6=>[true, {:author=>"Philip Reynolds", :title=>"felis eu2004", :year=>1901, :chapters=>["ut", "quam", "rutrum", "morbi"], :price=>15.59}]}}
		return mock_data,expected_result
	end
end