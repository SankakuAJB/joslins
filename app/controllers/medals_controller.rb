class MedalsController < ApplicationController

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


	private

		def medal_params
			params.require(:medal).permit(:value, :tournament_id, :competitor_id)
		end

end
