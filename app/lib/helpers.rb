module NumberUtilities

	def self.limit (num, lo, hi)
		if num > hi
			return hi
		elsif num < lo			
			return lo
		else
			num
		end
	end

end