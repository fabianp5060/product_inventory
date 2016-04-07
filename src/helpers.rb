class Helpers

	def make_hoa
		hoa = Hash.new do |k1,v1|
            k1[v1] = Array.new
        end
        return hoa
	end

    def make_hoh(x=0)
        hoh = Hash.new do |k1,v1|
            k1[v1] = Hash.new(x)
        end
    end

    def make_hohoa
        hohoa = Hash.new do |k1,v1|
            k1[v1] = Hash.new do |k2,v2|
                k2[v2] = Array.new
            end
        end
    end

end