module CompetitorsHelper

	def sum(competitor)
		sum = 0
		competitor.medals.each do |medal|
			sum += medal.value * medal.tournament.multiplier
		end
		return sum
	end
	
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
