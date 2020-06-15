class ApplicationController < ActionController::Base
   helper_method :current_user, :logged_in?

   def home
   end

   private
   
   def logged_in?
      redirect_to root_path unless !!session[:user_id]
   end

   def current_user
      @current_gym ||= Gym.find_by(id: session[:user_id])
   end
end
