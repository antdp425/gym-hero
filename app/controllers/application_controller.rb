class ApplicationController < ActionController::Base
   helper_method :current_user , :logged_in?
   before_action :dashboard_if_logged_in, only: [:home]

   def home
   end

   private

   def dashboard_if_logged_in
      redirect_to dashboard_path if !!current_user
   end

   def logged_in?
      redirect_to root_path unless !!current_user 
   end

   def current_user
      @gym = Gym.find_by(id: session[:user_id])
   end
end
