class CompetitorsController < ApplicationController
	include CompetitorsHelper
	include ApplicationHelper
	helper_method :sort_column, :sort_direction

	def index
		@competitors = Competitor.order(sort_column + " " + sort_direction)
		@competitors.each do |competitor|
			score = sum(competitor)
			competitor.update_attribute(:score, score)
		end
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

		def sort_column
			Competitor.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end

end
