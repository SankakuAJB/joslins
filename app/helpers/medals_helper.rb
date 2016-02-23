module MedalsHelper

	def medal_colour(value)
		if value == 9
			return "Gold"
		elsif value == 5
			return "Silver"
		else
			return "Bronze"
		end
	end

end
