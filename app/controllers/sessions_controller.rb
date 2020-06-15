class SessionsController < ApplicationController
   
   def new
   end

   def create
      binding.pry
      if gym = Gym.find_by(email: session_params[:email])
         if gym.authenticate(session_params[:password])
            session[:user_id] = gym.id
            redirect_to gym
         else
            render :new
         end
      else
         render :new
      end
   end
   
   def destroy
      reset_session
      redirect_to root_path
   end

   private

   def session_params
      params.require(:gym).permit(:email, :password)
   end
end
