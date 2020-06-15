class ApplicationController < ActionController::Base
   helper_method :current_user , :logged_in?

   def home
      redirect_to dashboard_path if !!current_user
   end

   private

   def logged_in?
      redirect_to root_path unless !!current_user
   end

   def current_user
      @current_gym ||= Gym.find_by(id: session[:user_id])
   end
end
