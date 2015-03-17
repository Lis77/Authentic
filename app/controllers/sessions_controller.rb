class SessionsController < ApplicationController

	def create
	user = User.find_by(email: session_params[:email])
	if user && user.authenticate(session_params[:password])
	   session[:user_id] = user.id 
	   redirect_to root_path, notice: 'You are signed in!'
   else
    redirect_to new_session_path, notice: 'Invalid!'
end

def destroy
	session.delete(:user_id)
	redirect_to root_path, notice: 'Session Ended!'
end

private
	def sesssion_params
		params.require(:session).permit(:email, :password)
	end
end
