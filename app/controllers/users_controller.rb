class UsersController < ApplicationController

	def new
		@user = User.new
	end



	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path, notice: 'Thanks for signing up!'\
		else
			render 'new'  # this create just adds a user to the database, it doesn't sign them in
		end
	end

	def update
		@last_signed_in_at = Time.new(user_params)
		 @last_signed_in_at.save
		 redirect_to root_path
	end

  private
  	def user_params
  	params.require(:user).permit(:name, :email, :password)
  	end
end
