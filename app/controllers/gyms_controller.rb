class GymsController < ApplicationController
   before_action :dashboard_if_logged_in, only: [:new, :create]
   before_action :logged_in?, only: [:dashboard]
   # skip_before_action :verify_authenticity_token, only: [:create]
   
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

   def dashboard
      @members = current_gym.members
      @classes = current_gym.gym_classes
      @todays_classes = current_gym.scheduled_classes.todays_classes
   end
   

   def today
      @classes = current_gym.scheduled_classes.todays_classes
   end

   private
   
   def gym_params
      params.require(:gym).permit(:email, :password)
   end
   
end
