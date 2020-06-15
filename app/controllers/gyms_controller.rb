class GymsController < ApplicationController
   before_action :logged_in?, only: [:show]

   def dashboard
   end
   
   def new
      @gym = Gym.new
   end

   def create
      @gym = Gym.create(gym_params)
      session[:user_id] = @gym.id 
      redirect_to dashboard_path
   end

   private
   
   def gym_params
      params.require(:gym).permit(:email, :password)
   end
   
end
