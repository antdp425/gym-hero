class GymsController < ApplicationController
   def new
      @gym = Gym.new
   end

   def create
      @gym = Gym.create(gym_params)
      binding.pry
      redirect_to @gym
   end

   def show
      @gym = Gym.find_by(id: params[:id]) 
   end

   private
   
   def gym_params
      params.require(:gym).permit(:email, :password)
   end
end
