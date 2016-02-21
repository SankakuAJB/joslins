class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(name: params[:session][:name])
		if @user && @user.authenticate(params[:session][:password])
			log_in @user
			params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
			redirect_to root_url
		else
			flash.now[:danger] = 'Invalid name/password combination'
			render 'new'
		end
	end

end
