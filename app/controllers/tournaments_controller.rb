class TournamentsController < ApplicationController

	def new
		@tournament = Tournament.new
	end

	def create
		@tournament = Tournament.new(tournament_params)
		if @tournament.save
			flash[:success] = "Tournament was added"
			redirect_to root_url
		else
			render 'new'
		end
	end


	private

		def tournament_params
			params.require(:tournament).permit(:name, :multiplier)
		end

end
