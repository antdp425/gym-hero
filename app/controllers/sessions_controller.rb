class SessionsController < ApplicationController
   
   def new
   end

   def create
      if params[:provider].present?
         gym = Gym.find_or_create_by(uid: auth_hash["uid"])
         if !!gym.id
            session[:user_id] = gym.id
            redirect_to gym_path(gym)
         else
            gym.email = auth_hash[:info][:email]
            gym.provider_name = auth_hash[:provider]
            gym.using_provider = true
            gym.save(:validate => false)
            session[:user_id] = gym.id
            redirect_to gym_path(gym)
         end
      else
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
   end
   
   def destroy
      reset_session
      redirect_to root_path
   end

   private

   def session_params
      params.require(:gym).permit(:email, :password)
   end

   def auth_hash
      request.env["omniauth.auth"]
   end
end
