class GymsController < ApplicationController
   before_action :logged_in?, only: [:dashboard]
   before_action :dashboard_if_logged_in, only: [:new, :create]

   def dashboard
   end
   
   def new
      @gym = Gym.new
   end

   def create
      @gym = Gym.new(gym_params)
         if @gym.save      
            session[:user_id] = @gym.id
            redirect_to dashboard_path
         else
            render :new
         end
   end

   private
   
   def gym_params
      params.require(:gym).permit(:email, :password)
   end
   
end
