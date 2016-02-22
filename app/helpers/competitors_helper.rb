module CompetitorsHelper

	def sum(competitor)
		sum = 0
		competitor.medals.each do |medal|
			sum += medal.value * medal.tournament.multiplier
		end
		return sum
	end
	
end
