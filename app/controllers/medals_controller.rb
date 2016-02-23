class MedalsController < ApplicationController
	include MedalsHelper
	include ApplicationHelper
	helper_method :sort_column, :sort_direction
	before_action :logged_in_user, only: [:new, :create]

	def new
		@medal = Medal.new
	end

	def create
		@medal = Medal.new(medal_params)
		if @medal.save
			flash[:success] = "Medal added"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def index
		@medals = Medal.order(sort_column + " " + sort_direction)
	end


	private

		def medal_params
			params.require(:medal).permit(:value, :tournament_id, :competitor_id)
		end

		def sort_column
			Medal.column_names.include?(params[:sort]) ? params[:sort] : "tournament_id"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end

end
