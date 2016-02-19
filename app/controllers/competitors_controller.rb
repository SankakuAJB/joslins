class CompetitorsController < ApplicationController

	def index

	end

	def new
		@competitor = Competitor.new
	end

	def create
		@competitor = Competitor.new(competitor_params)
		if @competitor.save
			flash[:success] = "Competitor added"
			redirect_to root_url
		else
			render 'new'
		end
	end


	private

		def competitor_params
			params.require(:competitor).permit(:name)
		end

end
