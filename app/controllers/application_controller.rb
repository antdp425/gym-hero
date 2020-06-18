class ApplicationController < ActionController::Base
   helper_method :current_gym , :logged_in?
   before_action :dashboard_if_logged_in, only: [:home]

   def home
   end

   private

   def dashboard_if_logged_in
      redirect_to dashboard_path if !!current_gym
   end

   def logged_in?
      redirect_to root_path unless !!current_gym 
   end

   def current_gym
      @gym = Gym.find_by(id: session[:user_id])
   end

end
