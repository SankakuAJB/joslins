class TournamentsController < ApplicationController
	include CompetitorsHelper
	include ApplicationHelper
	helper_method :sort_column, :sort_direction
	before_action :logged_in_user, only: [:new, :create]


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

	def index
		@tournaments = Tournament.order(sort_column + " " + sort_direction)
	end

	def show
		@tournament = Tournament.find(params[:id])
		@medals = @tournament.medals
	end


	private

		def tournament_params
			params.require(:tournament).permit(:name, :multiplier)
		end

		def sort_column
			Tournament.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end

end
